# http://d.hatena.ne.jp/kei_q/20110308/1299594629
# http://qiita.com/items/1f2c7793944b1f6cc346
function _show-buffer-stack {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N _show-buffer-stack
setopt noflowcontrol
bindkey '^Q' _show-buffer-stack

function _kill-backward-blank-word {
  # 現在位置から左のスペースまでをkillする
  zle set-mark-command
  zle vi-backward-blank-word
  zle kill-region
}
zle -N _kill-backward-blank-word
bindkey '^S' _kill-backward-blank-word

function _kill-first-word {
  zle beginning-of-line
  zle kill-word
}
zle -N _kill-first-word
bindkey '^V' _kill-first-word

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
