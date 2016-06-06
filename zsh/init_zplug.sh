#!/bin/sh
curl -sL get.zplug.sh | zsh
if [ $? -eq 0 ] ; then
  mkdir plugins
  export ZPLUG_HOME=$HOME/.dotfiles/zsh/plugins/.zplug
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  echo "SUCCESS!!"
else
  echo "ERROR: curl"
fi
