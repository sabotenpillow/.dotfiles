common_env=$HOME/.dotfiles/shell/common.conf.d/env.bash
common_path=$HOME/.dotfiles/shell/common.conf.d/path.bash

[ -e $common_env ] && source $common_env
[ -e $common_path ] && source $common_path

## fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
