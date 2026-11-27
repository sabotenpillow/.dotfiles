common_env_path=$HOME/.dotfiles/shell/common.conf.d/env.bash
[ -e $common_env_path ] && source $common_env_path

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
