## .bashrc

## Source global definitions
# if [ -f /etc/bashrc ]; then
# 	. /etc/bashrc
# fi

#
## aliases
#
if [ -e ~/.dotfiles/bash/alias.bash ]; then
  . ~/.dotfiles/bash/alias.bash
fi

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
    suffix="${RESET}"
    echo `get-branch-status`${suffix}
}
function get-branch-name() {
    local git='git'
    # gitディレクトリじゃない場合のエラーを捨てる
    echo $(${git} rev-parse --abbrev-ref HEAD 2> /dev/null)
}

# mark of branch prompt -> |⭠, :|
function get-branch-status() {
    local nothing="046"
    local untracked="190"
    local unstaged="160"
    local other="045"
    local default="[38;05;000m"
    local nothing_F="[38;05;${nothing}m"
    local nothing_B="[30;48;05;${nothing}m"
    local untracked_F="[38;05;${untracked}m"
    local untracked_B="[30;48;05;${untracked}m"
    local unstaged_F="[38;05;${unstaged}m"
    local unstaged_B="[30;48;05;${unstaged}m"
    local other_F="[38;05;${other}m"
    local other_B="[30;48;05;${other}m"
    local git='git' branchstatus branchname
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
    out_color=${out_color} # '%{'${bg[black]}${out_color}'%}'
    in_color=${default}${in_color}
    reset=${RESET}
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
    local fg_color="[38;5;${color}m"
    local bg_color="[30;48;5;${color}m"
    local char_color='[38;5;255m%'
    local separater='\ue0c7'
    echo "${fg_color}${separater}${bg_color}${char_color}$COUNT"
  fi
}

TEST="testtesttest"
# GIT_BRANCH="$(branch-status-check)"
export GIT_BRANCH="`branch-status-check`"
# RPROMPT="\[\e[$[COLUMNS]D\]\[\e[1;31m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]${GIT_BRANCH}\[\e[$[COLUMNS]D\]\[\e[0m\]"
RPROMPT="$GIT_BRANCH"
PS1="\n[${USER}\u${RESET}${AT}@${RESET}${HOST}\h${RESET}] ${DIRC}\w$RESET\n\$ ${RPROMPT}"

## simple prompt
DOLLAR="[01;38;5;171m"
PS1="${DOLLAR}\$ ${RESET}"
