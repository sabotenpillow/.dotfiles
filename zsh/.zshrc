##  環境設定
autoload -Uz compinit
compinit
autoload -U colors; colors
autoload -Uz add-zsh-hook

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##  オプション

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

setopt no_beep
# setopt auto_cd


##  エイリアス

local alias_path=$HOME/.dotfiles/zsh/alias.zsh
if [[ -e $alias_path ]] ; then
  source $alias_path
fi

##  zplug

export ZPLUG_HOME=$HOME/.dotfiles/zsh/plugins/.zplug
local zplug_init=$ZPLUG_HOME/init.zsh
local zplug_property=$HOME/.dotfiles/zsh
if [[ -e $zplug_init ]] ; then
  source $zplug_property/zplug_load.zsh
else
  echo;echo "$fg[red]not found zplug directory$reset_color"
fi

##  LEFT PROMPT

# local simple_prompt=$zsh_dir/zsh_simple_prompt
local prompt=$HOME/.dotfiles/zsh/left_prompt.zsh

if [ "$TERM" = linux ] ; then
  [ -e $simple_prompt ] && source $simple_prompt
else
  [ -e $prompt ] && source $prompt
fi

## RIGHT PROMPT

local rprompt=$HOME/.dotfiles/zsh/right_prompt.zsh
[ -e $rprompt ] && source $rprompt
