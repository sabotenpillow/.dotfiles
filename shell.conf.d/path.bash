echo Loading common PATH settings

source ~/.dotfiles/shell.conf.d/functions/load_path.bash
load_path /sbin
load_path /usr/sbin
load_path /usr/local/sbin
load_path /bin
load_path /usr/bin
load_path /usr/local/bin

## linuxbrew path
if is_included_in_path linuxbrew ; then
  if [ -d $HOME/.linuxbrew ] ; then
    eval $($HOME/.linuxbrew/bin/brew shellenv)
  elif [ -d /home/linuxbrew/.linuxbrew ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
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

## SDKMAN
# if [ -d $HOME/.sdkman ]; then
#   source $HOME/.sdkman/bin/sdkman-init.sh
# fi

## tomcat7
load_path /usr/local/opt/tomcat@7/bin/

## dart@2.12
load_path /Library/dart/dart-sdk-v1.24.3/bin/
load_path $HOME/.pub-cache/bin

## anyenv path
# load_path $HOME/.anyenv/bin
# if type anyenv > /dev/null 2>&1; then
#   eval "$(anyenv init - shellenv)"
# fi

## yarn env
load_path $HOME/.yarn/bin

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home/
#load_path $JAVA_HOME/bin/
