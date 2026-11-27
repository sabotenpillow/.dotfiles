export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "b4b4r07/enhancd", use:init.sh
# zplug "b4b4r07/zle-vimode"
#zplug "b4b4r07/zsh-vimode-visual", use:"*.sh"
#zplug "hchbaw/opp.zsh"
# zplug "ardagnir/athame"
# zplug "hchbaw/auto-fu.zsh", at:pu, use:auto-fu.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "rupa/z", use:"*.sh"
zplug "jonmosco/kube-ps1"

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
if zplug check hchbaw/auto-fu.zsh; then
  if has auto-fu-init; then
    function zle-line-init() { auto-fu-init }
    zle -N zle-line-init
    zstyle ':auto-fu:var' postdisplay $''
    zstyle ':completion:*' completer _expand _oldlist _complete _match _prefix _approximate _list _history
  fi
fi

if zplug check zsh-users/zsh-autosuggestions; then
  bindkey '^[i' autosuggest-accept
  bindkey '^[m' autosuggest-execute
fi
