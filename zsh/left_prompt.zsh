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
  # fchr="-"
  # fchr="="
  fchr="<"
  while [ $REMAIN -gt 0 ]
  do
    PROMPT="${PROMPT}${fchr}"
    REMAIN=$((${REMAIN}-1))
  done
}


USER_COLOR='%{[38;5;002m%}'    # user name color
HOST_COLOR='%{[38;5;057m%}'    # hsot name color
DIRC_COLOR='%{[38;5;031m%}'    # current directory color
BORDER_COLOR='%{[38;5;093m%}'  # border color
INLINE_COLOR='%{[38;5;006m%}'  # in-line color
STATUS_COLOR='%{[38;5;001m%}'  # end status color
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
  USER_AND_HOST="[${USER}@${HOST}] ${cwd} "

# IPアドレス
  REMAIN=$(( ${COLUMNS} - ${#USER_AND_HOST} ))
}

set_color () {

  s_line_f="<<-(%#"
  s_line_l=")->> "

  PROMPT="
[${USER_COLOR}%n${RESET}@${HOST_COLOR}%m${RESET}] ${DIRC_COLOR}%~ ${BORDER_COLOR}"
  fill_char
  # PROMPT=${PROMPT}$'${INLINE_COLOR}${s_line_f}'$'%(?||${STATUS_COLOR}:${STATUS_COLOR}'$ret')'$'${INLINE_COLOR}${s_line_l}${RESET}'
  PROMPT="${PROMPT}
${INLINE_COLOR}${s_line_f}%(?||${STATUS_COLOR}:${STATUS_COLOR}$ret)${INLINE_COLOR}${s_line_l}${RESET}"

}

# コマンド実行前じ実行される特殊関数
precmd() {
	ret=$?
  first_line;
  set_color;
}

