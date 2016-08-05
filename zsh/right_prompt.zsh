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

# mark of branch prompt -> |⭠, :|
function get-branch-status() {
    local git==git branchstatus branchname
    local git_mark
    local deco_out_left deco_in_left deco_in_right deco_out_right
    local out_color in_color in_right_color
    local reset
    branchname=`get-branch-name`
    if [[ $branchname == 'master' ]] ; then
      git_mark='\u25CF' # '\u25B2'
      deco_out_left='\u2503'
    else
      git_mark='\uE0A0'
      deco_out_left='\uE0A1 \u2503'
    fi
#     deco_out_left='\u2503' # '\uE0B2 '
#     deco_out_right='\u2503' # '\uE0B2 '
    deco_in_left=${git_mark}' ' # '\u2016\uE0A0 '
    deco_in_right='\u2503'
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        out_color="${fg[green]}"
        in_color="${bg[green]}"
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        out_color="${fg[yellow]}"
        in_color="${bg[yellow]}"
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        out_color="${fg[red]}"
        in_color="${bg[red]}"
    else
        out_color="${fg[cyan]}"
        in_color="${bg[cyan]}"
    fi
#     in_right_color=${out_color}
    out_color='%{'${out_color}'%}' # '%{'${bg[black]}${out_color}'%}'
    in_color='%{'${fg[black]}${in_color}'%}'
    reset='%{'${reset_color}'%}'
    branchname=${branchname}' '
#     branchstatus=${out_color}${deco_out_left}${in_color}${deco_in_left}${branchname} #${out_color}${deco_in_right}
    branchstatus=${in_color}${deco_in_left}${branchname} #${out_color}${deco_in_right}
#     branchstatus=${out_color}${deco_out_left}${in_color}${deco_in_left}${branchname}${in_right_color}${deco_in_right} # ${out_color}${deco_out_right}
    echo ${branchstatus}
}

#-------------------------------------------------
# Color Define
#-------------------------------------------------

GREEN="%{${bg[green]}%}"
CYAN="%{${bg[cyan]}%}"
RED="%{${fb[red]}%}"
RED_B="%{${fg_bold[red]}%}"
YELLOW="%{${bg[yellow]}%}"


#=================================================
#  Right Prompt
#=================================================

# autoload -Uz VCS_INFO_get_data_git && VCS_INFO_get_data_git 2> /dev/null
# # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt PROMPT_SUBST

# RPROMPT='`git-current-branch`'

#------------------------------------------------
# branch 名の取得
#------------------------------------------------

# git-current-branch() {
#   local name st color gitdir action
#   if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#     return
#   fi
#   name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
#   if [[ -z $name ]]; then
#     return
#   fi
# 
#   gitdir=`git rev-parse --git-dir 2> /dev/null`
#   action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
# 
#   st=`git status 2> /dev/null`
#   if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#     color=${GREEN}
#   elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
#     color=${YELLOW}
#   elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
#     color=${RED_B}
#   else
#     color=${RED}
#   fi
#   echo "${color} \uE0A0 ${name}${action}${RESET}"
# }

