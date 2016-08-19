export TERM=xterm-256color
# export EDITOR=vim

## local path
[ -d $HOME/.local ] && export PATH="$HOME/.local/bin:$PATH"

## lpm path
[ -d $HOME/local-packages-repository ] && export PATH="$HOME/local-packages-repository/bin:$PATH"

## linuxbrew path
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

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
if [ `which go` ] ; then
  export GOPATH="$HOME/gocode"
fi

## nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## get IP address
if [ `which cut` ] && [ $SSH_CONNECTION ] ; then
  export IP_ADDRESS=`echo $SSH_CONNECTION | cut -f3 -d ' '`
# elif [ `which nslookup` ] && [ `which hostname` ] ; then
#   export IP_ADDRESS=`nslookup \`hostname\` | grep Address | tail -n +2 | cut -f2 -d ' '`
fi

export LESS='-iMR'
# src-highlight-path="`which src-hilite-lesspipe.sh`"
# export LESSOPEN="| ${src-highlight-path} %s"
