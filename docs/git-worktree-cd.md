# git worktree を選んで cd する — なぜ git alias では実現できないのか

### 2-2. 【本質】git alias から親シェルの cd はできない

`!` 付き alias は **`sh -c` の子プロセス**として実行される。
cwd (カレントディレクトリ) は **カーネルがプロセスごとに持つ状態**であり、
`chdir(2)` は呼び出したプロセス自身にしか効かない。
fork 時に子はコピーを受け取るだけで、子から親へ書き戻す API は存在しない。

したがって「外部コマンドが親シェルの cd を変える」ことは**原理的に不可能**。
`cd` が shell builtin である理由そのもの。

実測:

```console
親シェルの PWD(前): .../delta
/tmp                          ← 子プロセス内では移動成功
親シェルの PWD(後): .../delta  ← 親は不変
```

これは git alias である限り回避できない (`git-cd` という外部コマンドを PATH に置いても同じ)。

### 2-3. 細かいバグ

| 箇所 | 問題 |
| --- | --- |
| `return $res` | `return` は関数 / source 内でしか使えない。`sh` では `can only 'return' from a function` エラー。`exit $res` が正しい |
| `$PWD` | `!` alias は**リポジトリのトップレベルに cd してから**実行されるので、`$PWD` は「今いるディレクトリ」ではなく worktree のルート |
| `grep -v $PWD` | クォートなし。かつ `$PWD` が正規表現として解釈される |
| `git worktree list` のパース | 出力はスペース詰めの整形済みテキスト。パスにスペースがあると `awk '{print $1}'` が壊れる |

### ドキュメント上の裏付け

`man git-config` の `alias.*` の項:

> If the alias expansion is prefixed with an exclamation point, it will be treated as a **shell command**.
>
> - Shell commands will be executed from **the top-level directory of a repository**, which may not necessarily be the current directory.
> - `GIT_PREFIX` is set as returned by running `git rev-parse --show-prefix` from the original current directory.

「shell command として実行」= git が別シェルを起動する、という意味。
2-3 の `$PWD` 問題もここに明記されている。

---

## 3. 「子プロセスである」ことの確認方法

### 3-1. `git` が外部バイナリであることを見る

```console
$ type git
git is /opt/homebrew/bin/git
```

シェル関数でも builtin でもない独立した実行ファイル。
シェルが `git` を実行する時点で必ず fork + exec が起きる。

### 3-2. `$$` と `$PPID` を比べる

```console
親シェル: pid=76826
alias   : pid=76884 ppid=76826   ← PID が別、かつ PPID が親を指す
```

> **落とし穴**: `$$` は「起動したシェルの PID」なので、`( ... )` のサブシェル内でも親の値のまま。
> 本当の PID が欲しい時は zsh なら `$sysparams[pid]` (要 `zmodload zsh/system`)、bash 4+ なら `$BASHPID`。
>
> ```console
> 親       : $$=77044  sysparams=77044
> subshell : $$=77044  sysparams=77045   ← $$ は嘘をつく
> ```

### 3-3. `ps` で PID / PPID / COMMAND を見る

```bash
ps -o pid,ppid,command -p $$ -p $PPID
```

```
  PID  PPID COMMAND
76826 76824 git who
76884 76826 /bin/sh -c echo "..."   ← git が fork した /bin/sh
```

`COMMAND` が `/bin/sh -c <alias本体>` になっているのが動かぬ証拠。

### 3-4. 子プロセスを列挙する / ツリーで見る

```bash
pgrep -P <親PID>                           # 直接の子を列挙
ps -ax -o pid,ppid,command | awk -v root=<親PID> '$2==root'
pstree -p <親PID>                          # macOS は brew install pstree
ps -ef --forest                            # Linux
```

### 3-5. プロセスごとの cwd を直接見る (今回の論点の決定打)

```bash
lsof -a -p <PID> -d cwd -Fn | sed -n 's/^n//p'   # macOS
readlink /proc/<PID>/cwd                          # Linux
```

`git slp` (= `!cd /tmp; sleep 8`) をバックグラウンド実行して実測:

```
pid=76918  cwd=/Users/h-tone/.../delta    ← 親シェル
pid=76920  cwd=/Users/h-tone/.../delta    ← git 本体 (PPID=76918)
pid=76922  cwd=/private/tmp               ← git が fork した sh (PPID=76920)
```

`cd /tmp` の効果が **76922 の中だけに閉じている**ことが一目でわかる。

---

## 4. 一瞬で終わるコマンドをどう観察するか

`git cd` は即座に終わるため、外から `ps` / `lsof` を叩いても間に合わない。対処は 2 通り。

### 4-1. 【本命】プロセス自身に報告させる — 寿命は一切関係ない

`ps` を *alias の中で* 実行すればよい。
さらに `git -c` で一時的に alias を上書きできるので `~/.gitconfig` を触らずに試せる。

```bash
git -c alias.probe='!echo "pid=$$ ppid=$PPID cwd=$(pwd)"; ps -o pid,ppid,command -p $$ -p $PPID' probe
```

```
pid=34422 ppid=34421 cwd=/Users/h-tone/.../delta
  PID  PPID COMMAND
34421 34419 git -c alias.probe=... probe      ← git 本体
34422 34421 /bin/sh -c echo "pid=$$ ..."      ← git が fork した sh
親シェル : pid=34419
```

34419 (親シェル) → 34421 (git) → 34422 (sh) の親子チェーンがそのまま出る。
ログに残したいなら末尾に `>> /tmp/probe.log` を付けて後から読む。

### 4-2. 子プロセスに自分を一時停止させる — 外から好きなだけ観察できる

`kill -STOP $$` を仕込むと子が SIGSTOP で固まるので、`ps` も `lsof` も落ち着いて叩ける。

```bash
git -c alias.cdtest='!cd /tmp; kill -STOP $$; echo "再開: $(pwd)"' cdtest &
GITPID=$!
sleep 1
SHPID=$(pgrep -P $GITPID)

ps -o pid,ppid,stat,command -p $$ -p $GITPID -p $SHPID
for p in $$ $GITPID $SHPID; do
  printf "pid=%-7s cwd=%s\n" "$p" "$(lsof -a -p $p -d cwd -Fn | sed -n 's/^n//p')"
done

kill -CONT $SHPID   # 観察が済んだら再開
```

```
  PID  PPID STAT COMMAND
34463 34089 SNs  /bin/zsh ...              ← 親シェル
34465 34463 SN   git -c alias.cdtest=... cdtest
34467 34465 TN   /bin/sh -c cd /tmp; ...   ← T = stopped で止まっている

pid=34463  cwd=/Users/h-tone/.../delta
pid=34465  cwd=/Users/h-tone/.../delta
pid=34467  cwd=/private/tmp                ← cd の効果はここだけ
```

`STAT` の `T` が「停止中」の印。
`sleep 30` を末尾に足す / `read -r _` で入力待ちにする、でも同じ。

### 4-3. 外部トレーサで短命プロセスを捕まえる — このマシンでは不可

- **Linux**: `strace -f -e trace=clone,execve,chdir git cd` / `execsnoop-bpfcc` / `forkstat` で確実に捕捉できる。
- **macOS (Darwin 25)**: `csrutil status` = **enabled**、かつ `/usr/bin/dtrace` が存在しない。
  `/usr/bin/execsnoop` と `/usr/bin/newproc.d` は DTrace スクリプトなので動かない。
  `sudo fs_usage -w -f exec` が候補だが sudo パスワードが必要 (未検証)。

→ macOS では **4-1** が本命、外から見たいなら **4-2**。

---

## 6. まとめ

| 問い | 答え |
| --- | --- |
| git alias で cd を実現できる? | **できない**。cwd はプロセスごとの状態で、子から親へ書き戻せない |
| どう実現する? | zsh のシェル関数 (`gwt`)。`git cd` 表記を保ちたいなら `git` 関数でラップ |
| 子プロセスの確認方法 | `$$` / `$PPID`、`ps -o pid,ppid,command`、`pgrep -P`、`lsof -d cwd` |
| 一瞬で終わる場合は? | alias の中から自己申告させる (`git -c alias.probe=...`)、または `kill -STOP $$` で固める |
