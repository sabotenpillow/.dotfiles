autoload colors -U && colors

# USER_COLOR='%{[38;5;057m%}'    # user name color
# HOST_COLOR='%{[38;5;040m%}'    # hsot name color
# IP_COLOR='%{[38;5;208m%}'      # IP address color
# DIRC_COLOR='%{[38;5;031m%}'    # current directory color
# BORDER_COLOR='%{[38;5;240m%}'  # border color
# VECTOR_COLOR='%{[38;5;093m%}'  # arrow color
# INLINE_COLOR='%{[38;5;051m%}'  # in-line color
# STATUS_COLOR='%{[38;5;001m%}'  # end status color
# DECO_F_COLOR='%{[38;5;093m%}'    # last color
# DECO_L_COLOR='%{[38;5;255m%}'    # last color
# COMMAND_COLOR='%{[38;5;255m%}' # command color

# USER='%{[38;5;057m%}%n${RESET}'
# USER='%{[38;5;057m%}%n'
# HOST="%{[38;5;040m%}%m"
# PWD='%{[38;5;031m%}%~'
# PROMPT='${USER}${RESET}@${HOST} ${PWD} '

PROMPT='`left-prompt`'
# PROMPT='%{[30;48;5;237m%}%{[38;5;178m%}%n@%m %{[30;48;5;067m%}%{[38;5;007m%}%~%{[0m%}'

function left-prompt {
  FIRST='178m%}'
  FIRST_B='237m%}'
  SECOND='007m%}'
  SECOND_B='067m%}' # 067

  # local sharp='\uE0B0'
  sharp='\uE0B0'
  FG='%{[38;5;'
  BG='%{[30;48;5;'
  # USER_AND_HOST=${FG}${USER_AND_HOST}
  # USER_AND_HOST_BACK=${BG}${USER_AND_HOST_BACK}
  USER_AND_HOST="${BG}${FIRST_B}${FG}${FIRST}"
  DIR="${BG}${SECOND_B}${FG}${SECOND}"
  RESET='%{[0m%}'

  # echo "${USER_AND_HOST}foo@bar ${DIR}%~${RESET}"
  echo "${USER_AND_HOST}%n@%m${BG}${SECOND_B}${FG}${FIRST_B}${sharp} ${DIR}%~${RESET}${FG}${SECOND_B}${sharp} ${RESET}"
  # echo "${USER_AND_HOST}foo@bar${BG}${SECOND_B}${FG}${FIRST_B}${sharp} ${DIR}%~${RESET}${FG}${SECOND_B}${sharp} ${RESET}"

  # branchname=`get-branch-name`
  # if [[ -z $branchname ]]; then
  #   echo "${USER_AND_HOST}%n@%m${BG}${SECOND_B}${FG}${FIRST_B}${sharp} ${DIR}%~${RESET}${FG}${SECOND_B}${sharp} "
  # else
  # fi
}

# function get-branch-name {
#   local prefix branchname suffix
#   # .gitの中だから除外
#   if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#     return
#   fi
#   # gitディレクトリじゃない場合のエラーは捨てます
#   branchname=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#   # ブランチ名が無いので除外
#   if [[ -z $branchname ]]; then
#     return
#   fi
#   echo ${branchname}
# }

# set_color () {
# 
#   status_code_f=":(%#"
#   status_code_l="):"
# 
#   PROMPT="
# [${USER_COLOR}%n${RESET}@${HOST_COLOR}%m${IP_COLOR}${ip_addr}${RESET}] ${DIRC_COLOR}%~ ${BORDER_COLOR}"
#   fill_char
#   PROMPT="${PROMPT}
# ${DECO_F_COLOR}:(%#%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${DECO_L_COLOR}):${RESET} "
# 
# }
# 
# precmd() {
# 	ret=$?
#   set_color;
# }
# 
