# プロンプトに escape sequence (環境変数) を通す
setopt prompt_subst
autoload colors -U && colors
autoload zsh/terminfo


#=====================================================================

# 文字数に変換 ${#${:-STR}}

# プロンプトの余り部分を埋める
fill_char () {
  # 埋める文字
  # fchr="⇉"
  # fchr="■"
  # fchr="✚"
  # fchr="❚"
  fchr="-"
  # fchr="="
  # fchr="<"
  first_line
  while [ $REMAIN -gt 0 ]
  do
    PROMPT="${PROMPT}${fchr}"
    REMAIN=$((${REMAIN}-1))
  done
}


USER_COLOR='%{[38;5;057m%}'    # user name color
HOST_COLOR='%{[38;5;040m%}'    # hsot name color
IP_COLOR='%{[38;5;208m%}'      # IP address color
DIRC_COLOR='%{[38;5;031m%}'    # current directory color
BORDER_COLOR='%{[38;5;240m%}'  # border color
VECTOR_COLOR='%{[38;5;093m%}'  # arrow color
INLINE_COLOR='%{[38;5;051m%}'  # in-line color
STATUS_COLOR='%{[38;5;001m%}'  # end status color
DECO_F_COLOR='%{[38;5;093m%}'    # last color
DECO_L_COLOR='%{[38;5;255m%}'    # last color
COMMAND_COLOR='%{[38;5;255m%}' # command color
local hist='238'
HISTORY_COLOR='%{[38;5;111m%}' # command color  # 111, 105, 040, 106, 190, 201, 177, 184, 003
HISTORY_BCOLOR="%{[30;48;5;${hist}m%}" # command color
HIST_DECO_COLOR="%{[38;5;${hist}m%}"
RESET='%{[0m%}'


first_line () {
  # HOST=$HOSTNAME
  # HOST=`hostname`
  cwd=`print -P "%~"`
  if [ $cwd = "~cwd" ]; then
    cwd=`print -P "%~"`
  fi
  # COLUMNS=`tput cols`
  # USER_AND_HOST="[${USER}@${HOST}] ${cwd} "
  USER_AND_HOST="[${USER}@${HOST}${ip_addr}] ${cwd} "
  # USER_AND_HOST="[${USER}@${HOST}] (:$ret) ${cwd} "
  # if [ $ret = 0 ]; then
  #   USER_AND_HOST="[${USER}@${HOST}] () ${cwd} "
  # fi

  REMAIN=$(( ${COLUMNS} - ${#USER_AND_HOST} -2 ))
  # REMAIN=${COLUMNS}
}

set_color () {

  s_line_f="-(%#"
  s_line_l=")->> "
  vector_f="-"
  vector_l="->> "
  status_code_f=":(%#"
  status_code_l="):"
  ip_addr='' # ":$IP_ADDRESS"
  hist=`get-history`

  PROMPT="
[${USER_COLOR}%n${RESET}@${HOST_COLOR}%m${IP_COLOR}${ip_addr}${RESET}] ${DIRC_COLOR}%~ ${BORDER_COLOR}"
  fill_char
  PROMPT="${PROMPT}
${hist}${DECO_F_COLOR}:(%#%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${DECO_L_COLOR}):${RESET} "
# ${HISTORY_BCOLOR}${HISTORY_COLOR}%!${RESET}${HIST_DECO_COLOR}\ue0bc${DECO_F_COLOR}:(%#%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${DECO_L_COLOR}):${RESET} "
#   PROMPT="${PROMPT}
# ${VECTOR_COLOR}${vector_f}${INLINE_COLOR}${status_code_f}%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${INLINE_COLOR}${status_code_l}${VECTOR_COLOR}${vector_l}${RESET}"

#   PROMPT="
# ${BORDER_COLOR}"
#   fill_char
#   PROMPT="${PROMPT}
# [${USER_COLOR}%n${RESET}@${HOST_COLOR}%m${RESET}] ${DIRC_COLOR}%~ ${BORDER_COLOR}"
#   PROMPT="${PROMPT}
# ${DECO_F_COLOR}:(%#%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${RESET}): "

}

function get-history {
  echo "${HISTORY_BCOLOR}${HISTORY_COLOR}%!${RESET}${HIST_DECO_COLOR}\ue0bc"
}

# コマンド実行前に実行される特殊関数
precmd() {
	ret=$?
  set_color;
}

