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
    local deco_out=':'
    local deco_in=':'
    local git==git branchstatus branchname
    branchname=`get-branch-name`
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        branchstatus='%{'${fg[green]}'%}'${deco_out}'%{'${fg[black]}${bg[green]}'%} '${deco_in}' '${branchname}
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        branchstatus='%{'${fg[yellow]}'%}'${deco_out}'%{'${fg[black]}${bg[yellow]}'%} '${deco_in}' '${branchname}
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        branchstatus='%{'${fg[red]}'%}'${deco_out}'%{'${fg[black]}${bg[red]}'%} '${deco_in}' '${branchname}
    else
        branchstatus='%{'${fg[cyan]}'%}'${deco_out}'%{'${fg[black]}${bg[cyan]}'%} '${deco_in}' '${branchname}
    fi
    echo ${branchstatus}' '
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

