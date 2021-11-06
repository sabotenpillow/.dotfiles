[ -e $HOME/.dotfiles/shell.conf.d/env.bash ] && source $HOME/.dotfiles/shell.conf.d/env.bash

if type gcloud > /dev/null 2>&1 ; then
  if [ `uname` = "Darwin" ] ; then
    source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
    source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  else
    source /usr/share/google-cloud-sdk/completion.zsh.inc
  fi
fi
