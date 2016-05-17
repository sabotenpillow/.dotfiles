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

setopt no_beep


################################################################
#  エイリアス
################################################################
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias e='emacs'
alias v='vim'
alias gs='git status'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset'"
alias gin='git init'
alias grad='git remote add'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias grs='git reset'
alias grv='git revert'
alias gt='git tag'
alias gtl='git tag -l'
alias gta='git tag -a'
alias gtn='git tag -n'
alias gtd='git tag -d'
alias gref='git reflog'
alias gpush='git push'
alias gp='git pull'
alias gbr='git branch'
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gchb='git checkout -b'
alias gap='git apply'
alias gapr='git apply -R'
alias gst='git stash'
alias gsk='git stash -k'
alias gsu='git stash -u'
alias gsl='git stash list'
# alias gsv='git stash save'
alias gslp='git stash list -p'
alias gss='git stash show'
alias gssp='git stash show -p'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gspop='git stash pop'
alias gsbr='git stash branch'
alias railss='rails s -b 0.0.0.0'
alias vag='vagrant'
alias sudoi='sudo -i'
alias tx='tmux'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tkill='tmux kill-session'
alias tkillserver='tmux kill-server'
alias viewcolor='for c in {000..255}; do echo -n "[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done'
alias colors='for x in {0..2}; do for c in {000..255}; do [ $(($c%3)) -eq $x ] && echo -n "[38;5;${c}m $c" ; [ $(($c%46)) -eq 45 ] && echo;done;done'

################################################################
#  プロンプト
################################################################
# PROMPT="
# [${fg[blue]}%n${reset_color}@${fg[red]}%m${reset_color}] %{${fg[yellow]}%}%~%{${reset_color}%}
# %# "

# ^[ は特殊記号
# vim では C-v の後に ESC で入力可能
USER_COLOR='%{[38;5;002m%}'  # user name color
HOST_COLOR='%{[38;5;057m%}'  # hsot name color
DIRC_COLOR='%{[38;5;031m%}'  # current directory color
RESET='%{[0m%}'
PROMPT="
[${USER_COLOR}%n${RESET}@${HOST_COLOR}%m${RESET}] ${DIRC_COLOR}%~${RESET}
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
