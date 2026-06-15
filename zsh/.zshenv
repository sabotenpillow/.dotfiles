[ -e "$HOME/.dotfiles/shell.conf.d/env.bash" ] && source "$HOME/.dotfiles/shell.conf.d/env.bash"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
