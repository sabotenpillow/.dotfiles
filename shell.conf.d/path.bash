echo Loading common PATH settings

source ~/.dotfiles/shell.conf.d/functions/load_path.bash
load_path /sbin
load_path /usr/sbin
load_path /usr/local/sbin
load_path /bin
load_path /usr/bin
load_path /usr/local/bin

## linuxbrew path
if is_included_in_path brew ; then
  if [ -d $HOME/.linuxbrew ] ; then
    eval $($HOME/.linuxbrew/bin/brew shellenv)
  elif [ -d /home/linuxbrew/.linuxbrew ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  elif [ -x /opt/homebrew/bin/brew ] ; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    load_path $(brew --prefix coreutils)/libexec/gnubin
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

## dart@2.12
load_path /Library/dart/dart-sdk-v1.24.3/bin/
load_path $HOME/.pub-cache/bin

## android
export ANDROID_HOME=$HOME/Library/Android/sdk
load_path $ANDROID_HOME/emulator
load_path $ANDROID_HOME/platform-tools

## anyenv path
# load_path $HOME/.anyenv/bin
# if type anyenv > /dev/null 2>&1; then
#   eval "$(anyenv init - shellenv)"
# fi

## yarn env
load_path $HOME/.yarn/bin

## asdf env
source $(brew --prefix asdf)/libexec/asdf.sh

## aqua bin
load_path ${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home/
#load_path $JAVA_HOME/bin/

typeset -U PATH
