export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/enhancd", use:init.sh
# zplug "b4b4r07/zle-vimode"
zplug "b4b4r07/zsh-vimode-visual", use:"*.sh"
zplug "hchbaw/opp.zsh"
# zplug "ardagnir/athame"

if ! zplug check; then
  zplug install
fi

zplug load --verbose

if zplug check b4b4r07/enhancd; then
  # export ENHANCD_FILTER=fzf-tmux
  export ENHANCD_FILTER=fzf
fi
if zplug check hchbaw/opp.zsh; then
  source $ZPLUG_HOME/repos/hchbaw/opp.zsh/opp/textobj-between.zsh
  source $ZPLUG_HOME/repos/hchbaw/opp.zsh/opp/surround.zsh
fi

