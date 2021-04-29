echo Loading common PATH settings

source ~/.dotfiles/shell.conf.d/functions/load_path.bash
load_path /sbin
load_path /usr/sbin
load_path /usr/local/sbin
load_path /bin
load_path /usr/bin
load_path /usr/local/bin

## linuxbrew path
if [ -d $HOME/.linuxbrew ] ; then
  eval $($HOME/.linuxbrew/bin/brew shellenv)
elif [ -d /home/linuxbrew/.linuxbrew ] ; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
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

## The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.bash.inc ]; then
  . $HOME/google-cloud-sdk/path.bash.inc
fi

## The next line enables shell command completion for gcloud.
if [ -f $HOME/google-cloud-sdk/completion.bash.inc ]; then
  . $HOME/google-cloud-sdk/completion.bash.inc
fi

if [ -d /usr/local/opt/openjdk@11 ]; then
  export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
  export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
fi

## anyenv path
if [ -d $HOME/.anyenv ] ; then
  echo $PATH |grep anyenv > /dev/null 2>&1 || export PATH=$PATH:$HOME/.anyenv/bin
  #export PATH=$PATH:$HOME/.anyenv/bin
  #eval (anyenv init -) > /dev/null 2>&1
fi

if type anyenv > /dev/null 2>&1; then
  eval "$(anyenv init - shellenv)"
fi
