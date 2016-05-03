################################################################
#  環境設定
################################################################
autoload -Uz compinit
compinit

autoload -U colors; colors

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

################################################################
#  オプション
################################################################
# setopt auto_cd


zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..


################################################################
#  エイリアス
################################################################
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias e='emacs'
alias v='vim'
alias gst='git status'
alias gdf='git diff'
alias glg='git log'
alias gin='git init'
alias grad='git remote add'
alias gad='git add'
alias gco='git commit -m'
alias gpush='git push'
alias gpl='git pull'
alias gbr='git branch'
alias gch='git checkout'
alias gchb='git checkout -b'
alias railss='rails s -b 0.0.0.0'
alias vag='vagrant'
alias sudoi='sudo -i'
alias tx='tmux'
alias txat='tmux attach -t'
alias tkill='tmux kill-session'
alias tkillserver='tmux kill-server'

################################################################
#  プロンプト
################################################################
PROMPT="
[${fg[blue]}%n${reset_color}@${fg[red]}%m${reset_color}] %{${fg[yellow]}%}%~%{${reset_color}%}
%# "

# git関連
RPROMPT=$'`branch-status-check`'
# 表示毎にPROMPTで設定されている文字列を評価する
setopt prompt_subst
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
function branch-status-check() {
    local branchname suffix
    # .gitの中だから除外
    [[ '$PWD' =~ '/\.git(/.*)?$' ]] && return
    branchname=`get-branch-name`
    # ブランチ名が無いので除外
    [[ -z $branchname ]] && return
    suffix='%{'${reset_color}'%}'
    echo `get-branch-status`${suffix}
}
function get-branch-name() {
    local git==git
    # gitディレクトリじゃない場合のエラーを捨てる
    echo `${git} rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status() {
    local git==git branchstatus branchname
    branchname=`get-branch-name`
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        branchstatus='%{'${fg[green]}'%}⮂%{'${fg[black]}${bg[green]}'%} ⭠ '${branchname}
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        branchstatus='%{'${fg[yellow]}'%}⮂%{'${fg[black]}${bg[yellow]}'%} ⭠ '${branchname}
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        branchstatus='%{'${fg[red]}'%}⮂%{'${fg[black]}${bg[red]}'%} ⭠ '${branchname}
    else
        branchstatus='%{'${fg[cyan]}'%}⮂%{'${fg[black]}${bg[cyan]}'%} ⭠ '${branchname}
    fi
    echo ${branchstatus}' '
}
