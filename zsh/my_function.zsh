function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}

function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}

# Helper function
# use 'zle -la' option
# zsh -la option returns true if the widget exists
has_widgets() {
  if [[ -z $1 ]]; then
    return 1
  fi
  zle -la "$1"
  return $?
}

# Helper function
# use bindkey -l
has_keymap() {
  if [[ -z $1 ]]; then
    return 1
  fi
  bindkey -l "$1" >/dev/null 2>&1
  return $?
}

has() {
  type "$1" > /dev/null 2>&1
}

# git worktree を fzf で選んで移動する
# usage: gwt [初期クエリ]
function gwt() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "gwt: not inside a git work tree" >&2
    return 1
  fi

  if ! has fzf; then
    echo "gwt: fzf not found" >&2
    return 1
  fi

  # porcelain 形式をパースして "ブランチ名<TAB>パス" の一覧を作る
  # (パスにスペースが含まれても壊れないようにタブ区切りにする)
  local list
  list=$(git worktree list --porcelain | awk '
    function flush() {
      if (path != "") {
        printf "%s\t%s\n", (ref == "" ? "(detached)" : ref), path
        path = ""; ref = ""
      }
    }
    /^worktree /  { flush(); path = substr($0, 10) }
    /^branch /    { ref = substr($0, 8); sub(/^refs\/heads\//, "", ref) }
    END           { flush() }
  ')

  if [[ -z "$list" ]]; then
    echo "gwt: no worktree found" >&2
    return 1
  fi

  local selected
  selected=$(print -r -- "$list" | fzf \
    --height=40% \
    --reverse \
    --prompt='worktree> ' \
    --delimiter=$'\t' \
    --with-nth=1,2 \
    --query="${1:-}" \
    --select-1 \
    --exit-0)

  # 選択されなかった (ESC など) 場合は何もしない
  [[ -z "$selected" ]] && return 1

  local dir="${selected#*$'\t'}"
  if [[ ! -d "$dir" ]]; then
    echo "gwt: directory not found: $dir" >&2
    return 1
  fi

  cd "$dir"
}
