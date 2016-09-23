## .bashrc

## Source global definitions
# if [ -f /etc/bashrc ]; then
# 	. /etc/bashrc
# fi

## User specific aliases and functions

alias al='alias'
alias hist='history'
alias histi='history -iD'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias lr='ls -R'
alias lt='pwd;find . | sort | sed "1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g"'
alias grep='grep --color=auto'
alias e='emacs'
alias v='vim'
alias vr='vim -R'
alias gg='git grep'
alias gs='git status'
alias gr='git reflog'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset'"
alias gin='git init'
alias gre='git remote'
alias grad='git remote add'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias grs='git reset'
alias grshard='git reset --hard'
alias grv='git revert'
alias gt='git tag'
alias gtl='git tag -l'
alias gta='git tag -a'
alias gtn='git tag -n'
alias gtd='git tag -d'
alias gpush='git push'
alias gp='git pull'
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch -m'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
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
alias bdl='bundle'
alias be='bundle exec'
alias rs='rails s -b 0.0.0.0'
alias rs7='rails s -b 0.0.0.0 -p 7777'
alias vag='vagrant'
alias sudoi='sudo -i'
# alias tx='tmux -2'
alias tx='tmux'
alias tn='tmux new -s'
alias tl='tmux ls'
alias ta='tmux attach'
alias tt='tmux attach -t'
alias tkl='tmux kill-session'
alias tkls='tmux kill-server'
alias viewcolor='for c in {000..255}; do echo -n "[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done'
alias backcolor='for c in {000..255}; do echo -n "[30;48;5;${c}m $c" ; [ $(($c%36)) -eq 35 ] && echo;done'
# alias u='$(git )'
alias play='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'
alias asterism='echo "\u2648 \u2649 \u264A \u264B \u264C \u264D \u264E \u264F \u2650 \u2651 \u2652 \u2653"'
alias trigram='echo "\u2630 \u2631 \u2632 \u2633 \u2634 \u2635 \u2636 \u2637"'
alias chess='echo "\u2654 \u2655 \u2656 \u2657 \u2658 \u2659 \u265A \u265B \u265C \u265D \u265E \u265F"'
alias traffic='echo "\u26D4 \u26D5 \u26DA \u26DB \u26DD"'
alias mapsym='echo "\u26E3 \u26EC \u26ED \u26ED \u26EE \u26EF \u26F0 \u26F1 \u26F2 \u26F4 \u26F5 \u26F6 \u26FA \u26FB"'
alias asteroid='echo "\u26B3 \u26B4 \u26B5 \u26B6 \u26B7 \u26B8 \u26B9 \u26BA \u26BB \u26BC"'
alias pentagram='echo "\u26E4 \u26E5 \u26E6 \u26E7"'
alias warning='echo "\u2620 \u2621 \u2622 \u2623"'
alias medic='echo "\u2624 \u2625"'
alias astro='echo "\u2609 \u263C \u263D \u263E \u263F \u2640 \u2641 \u2642 \u2643 \u2644 \u2645 \u2646 \u2647"'
alias haka='sudo haka'
alias hakac='sudo hakactl'
alias hakalog="sudo tail -f /var/log/syslog | grep 'haka\\['"
alias ipt='sudo iptables'
alias tcpd='sudo tcpdump'
alias vbm='VBoxManage'

## prompt

USER="[38;05;124m"
AT="[38;05;255m"
HOST="[38;05;027m"
DIRC="[38;05;171m"
RESET="\e[00m"

## slarized
eval $(dircolors $HOME/.solarized/dircolors.256dark)

## fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
## bash function
#

# 表示毎にPROMPTで設定されている文字列を評価する
# setopt prompt_subst
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

# mark of branch prompt -> |⭠, :|
function get-branch-status() {
    local nothing="046"
    local untracked="190"
    local unstaged="160"
    local other="045"
    local nothing_F="[38;05;${nothing}m"
    local nothing_B="[30;48;05;${nothing}m"
    local untracked_F="[38;05;${untracked}m"
    local untracked_B="[30;48;05;${untracked}m"
    local unstaged_F="[38;05;${unstaged}m"
    local unstaged_B="[30;48;05;${unstaged}m"
    local other_F="[38;05;${other}m"
    local other_B="[30;48;05;${other}m"
    local git==git branchstatus branchname
    local git_mark
    local deco_out_left deco_in_left deco_in_right deco_out_right
    local out_color in_color in_right_color
    local reset
    branchname=`get-branch-name`
    deco_out_left='\ue0ba'
    if [[ $branchname == 'master' ]] ; then
      git_mark='\uF011 ' # '\u25B2'
      # deco_out_left='\u2503'
    else
      git_mark='\uE0A0 '
      # deco_out_left='\uE0A1 \u2503'
    fi
#     deco_out_left='\u2503' # '\uE0B2 '
#     deco_out_right='\u2503' # '\uE0B2 '
    deco_in_left=' '${git_mark} # '\u2016\uE0A0 '
    deco_in_left=${git_mark} # '\u2016\uE0A0 '
    deco_in_right='\u2503'
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        out_color="${nothing_F}"
        in_color="${nothing_B}"
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        out_color="${untracked_F}"
        in_color="${untracked_B}"
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        out_color="${unstaged_F}"
        in_color="${unstaged_B}"
    else
        out_color="${other_F}"
        in_color="${other_B}"
    fi
#     in_right_color=${out_color}
    out_color='%{'${out_color}'%}' # '%{'${bg[black]}${out_color}'%}'
    in_color='%{'${fg[black]}${in_color}'%}'
    reset='%{'${reset_color}'%}'
    branchname=${branchname}' '
    local stash=`git_stash_count`
#     branchstatus=${out_color}${deco_out_left}${in_color}${deco_in_left}${branchname} #${out_color}${deco_in_right}
    # branchstatus=${in_color}${deco_in_left}${branchname} #${out_color}${deco_in_right}
    branchstatus=${stash}${out_color}${deco_out_left}${in_color}${deco_in_left}${branchname} #${out_color}${deco_in_right}
#     branchstatus=${out_color}${deco_out_left}${in_color}${deco_in_left}${branchname}${in_right_color}${deco_in_right} # ${out_color}${deco_out_right}
    echo ${branchstatus}
}

#-------------------------------------------------
# Color Define
#-------------------------------------------------

# local nothing="046"
# local untracked="190"
# local unstaged="160"
# local other="045"
# local nothing_F="[38;05;${nothing}m"
# local nothing_B="[30;48;05;${nothing}m"
# local untracked_F="[38;05;${untracked}m"
# local untracked_B="[30;48;05;${untracked}m"
# local unstaged_F="[38;05;${unstaged}m"
# local unstaged_B="[30;48;05;${unstaged}m"
# local other_F="[38;05;${other}m"
# local other_B="[30;48;05;${other}m"
# RESET="\e[00m"

## git stash count
function git_stash_count {
  local COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -ge 0 ]; then
    local color='093'
    local fg_color="%{[38;5;${color}m%}"
    local bg_color="%{[30;48;5;${color}m%}"
    local char_color='%{[38;5;255m%}'
    local separater='\ue0c7'
    echo "${fg_color}${separater}${bg_color}${char_color}$COUNT"
  fi
}

GIT_BRANCH="$(branch-status-check)"
# RPROMPT="\[\e[$[COLUMNS]D\]\[\e[1;31m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]${GIT_BRANCH}\[\e[$[COLUMNS]D\]\[\e[0m\]"
RPROMPT="$GIT_BRANCH"
PS1="\n[${USER}\u${RESET}${AT}@${RESET}${HOST}\h${RESET}] ${DIRC}\w$RESET\n\$ ${RPROMPT}"

## simple prompt
DOLLAR="[01;38;5;171m"
PS1="${DOLLAR}\$ ${RESET}"
