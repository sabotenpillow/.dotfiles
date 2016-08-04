# http://d.hatena.ne.jp/kei_q/20110308/1299594629
# http://qiita.com/items/1f2c7793944b1f6cc346
function show_buffer_stack {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack

function kill_first_word {
  zle beginning-of-line
  zle kill-word
}
zle -N kill_first_word
bindkey '^S' kill_first_word

# function my_enter {
#   if [[ -n "$BUFFER" ]]; then
#     builtin zle .accept-line
#     return 0
#   fi
#   if [ "$WIDGET" != "$LASTWIDGET" ]; then
#     MY_ENTER_COUNT=0
#   fi
#   case $[MY_ENTER_COUNT++] in
#     0)
#       BUFFER=" ls"
#       ;;
#     1)
#       if [[ -d .svn ]]; then
#         BUFFER=" svn status"
#       elif git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
#         BUFFER=" git status -sb"
#       fi
#       ;;
#     *)
#       unset MY_ENTER_COUNT
#       ;;
#   esac
#   builtin zle .accept-line
# }
# zle -N my_enter
# bindkey '^m' my_enter