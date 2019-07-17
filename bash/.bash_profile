export LANG=en_US.UTF-8
export TERM=xterm-256color
# export EDITOR=vim

## linuxbrew path
if [ -d /home/linuxbrew/.linuxbrew ] ; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

## rbenv path
if [ -d $HOME/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

## pyenv path
if [ -d $HOME/.pyenv ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

## go path
if type go > /dev/null 2>&1; then
  export GOPATH="$HOME/go"
  if [ -d $GOPATH ] ; then
    PATH="$GOPATH/bin:$PATH"
  else
    echo "exec 'mkdir $GOPATH!!!'"
  fi
fi

## gvm path
if [ -d $HOME/.gvm ] ; then
  source $HOME/.gvm/scripts/gvm
fi

## nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## anyenv path
#if [ -d $HOME/.anyenv ] ; then
#  export PATH=$PATH:$HOME/.anyenv/bin
#  eval (anyenv init -) > /dev/null 2>&1
#fi

## lpm path
[ -d $HOME/local-packages-repository ] && export PATH="$HOME/local-packages-repository/bin:$PATH"

## my scripts path
[ -d $HOME/.my_scripts ] && export PATH="$HOME/.my_scripts/bin:$PATH"
exec fish
