## .bashrc

## Source global definitions
# if [ -f /etc/bashrc ]; then
# 	. /etc/bashrc
# fi

## User specific aliases and functions

local alias_path=$HOME/.dotfiles/zsh/alias.zsh
if [[ -e $alias_path ]] ; then
  source $alias_path
fi

## prompt

PS1="\n[[38;05;124m\u\e[00m[38;05;255m@\e[00m[38;05;027m\h\e[00m] [38;05;171m\w\e[00m\n\$ "

## slarized
eval $(dircolors $HOME/.solarized/dircolors.256dark)

## fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
