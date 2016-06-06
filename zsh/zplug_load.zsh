export ZPLUG_HOME=$HOME/.dotfiles/zsh/plugins/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"
zplug "mollifier/cd-gitroot"    # cd to git root

zplug load --verbose
