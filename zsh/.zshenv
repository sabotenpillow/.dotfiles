export TERM=xterm-256color
# export EDITOR=vim

## my scripts path
[ -d $HOME/.my_scripts ] && export PATH="$HOME/.my_scripts/bin:$PATH"

## local path
[ -d $HOME/.local ] && export PATH="$HOME/.local/bin:$PATH"

## lpm path
[ -d $HOME/local-packages-repository ] && export PATH="$HOME/local-packages-repository/bin:$PATH"

## linuxbrew path
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

## rbenv path
if [ -d $HOME/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

## goenv path
if [ -d $HOME/.goenv ] ; then
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi

## go path
if type go > /dev/null 2>&1; then
  export GOPATH="$HOME/gocode"
fi

## nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
