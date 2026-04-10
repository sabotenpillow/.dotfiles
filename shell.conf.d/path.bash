source ~/.dotfiles/shell.conf.d/functions/load_path.bash
load_path /sbin
load_path /usr/sbin
load_path /usr/local/sbin
load_path /bin
load_path /usr/bin
load_path /usr/local/bin

## linuxbrew path
brew_bin=
if [ -x "$HOME/.linuxbrew/bin/brew" ] ; then
  brew_bin="$HOME/.linuxbrew/bin/brew"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ] ; then
  brew_bin=/home/linuxbrew/.linuxbrew/bin/brew
elif [ -x /opt/homebrew/bin/brew ] ; then
  brew_bin=/opt/homebrew/bin/brew
elif [ -x /usr/local/bin/brew ] ; then
  brew_bin=/usr/local/bin/brew
fi

if [ -n "$brew_bin" ] ; then
  eval "$("$brew_bin" shellenv)"

  coreutils_gnubin="$("$brew_bin" --prefix coreutils 2> /dev/null)/libexec/gnubin"
  [ -d "$coreutils_gnubin" ] && load_path "$coreutils_gnubin"
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
if [ -n "${ZSH_VERSION:-}" ] && [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
elif [ -n "${BASH_VERSION:-}" ] && [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then
  . "$HOME/google-cloud-sdk/path.bash.inc"
fi

## The next line enables shell command completion for gcloud.
if [ -n "${ZSH_VERSION:-}" ] && [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
elif [ -n "${BASH_VERSION:-}" ] && [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.bash.inc"
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
if [ -n "$brew_bin" ] ; then
  asdf_sh="$("$brew_bin" --prefix asdf 2> /dev/null)/libexec/asdf.sh"
  [ -f "$asdf_sh" ] && source "$asdf_sh"
fi

## aqua bin
load_path ${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home/
#load_path $JAVA_HOME/bin/

load_path $HOME/.volta/bin

typeset -U PATH
