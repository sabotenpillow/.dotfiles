export ZPLUG_HOME=$HOME/.dotfiles/zsh/plugins/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"
zplug "mollifier/cd-gitroot", as:command, use:cd-gitroot  # cd to git root
zplug 'zsh-users/zsh-syntax-highlighting', nice:10
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main line brackets)

zplug load --verbose
