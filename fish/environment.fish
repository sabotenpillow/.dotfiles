set TERM xterm-256color
set LANG en_US.UTF-8
# set EDITOR vim

## my scripts path
# [ -d $HOME/.my_scripts ] and set PATH $HOME/.my_scripts/bin $PATH

## local path
# [ -d $HOME/.local ] and set PATH $HOME/.local/bin $PATH

## lpm path
# [ -d $HOME/local-packages-repository ] and set PATH $HOME/local-packages-repository/bin $PATH

## linuxbrew path
if test -d $HOME/.linuxbrew
  set PATH $HOME/.linuxbrew/bin $PATH
  # set MANPATH $HOME/.linuxbrew/share/man $MANPATH
  # set INFOPATH $HOME/.linuxbrew/share/info $INFOPATH
  # set LD_LIBRARY_PATH $HOME/.linuxbrew/lib $LD_LIBRARY_PATH
  # if [ -f $(brew --prefix)/etc/brew-wrap ];then
  #   source $(brew --prefix)/etc/brew-wrap
  # fi
end

## rbenv path
if test -d $HOME/.rbenv
  set PATH $HOME/.rbenv/bin $PATH
  eval (rbenv init -)
  # set PATH $HOME/.rbenv/shims $PATH
end

if test -d $HOME/.pyenv
  set PYENV_ROOT $HOME/.pyenv
  set PATH $PYENV_ROOT/bin $PATH
  # eval "(pyenv init -)"
  # eval "(pyenv virtualenv-init -)"
  eval (pyenv init -) # > /dev/null 2>&1
  # eval (pyenv virtualenv-init -)
end

## goenv path
# if [ -d $HOME/.goenv ] ; then
#   set PATH $HOME/.goenv/bin $PATH
#   eval "$(goenv init -)"
# fi

## go path
if type go > /dev/null 2>&1
  set GOPATH $HOME/go
  if test -d $GOPATH
    set PATH $GOPATH/bin $PATH
  else
    echo "exec 'mkdir $GOPATH!!!'"
  end
end

## gvm path
if test -d $HOME/.gvm
  # set PATH $HOME/.gvm/scripts $PATH
  # source $HOME/.gvm/scripts/gvm
end

## nvm path
# set NVM_DIR "$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] and . "$NVM_DIR/nvm.sh"  # This loads nvm