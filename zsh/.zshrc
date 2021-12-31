local zsh_dir=$HOME/.dotfiles/zsh

function source_shell() {
  if [[ -e $1 ]] ; then
    source $1
  fi
}

##  環境設定
autoload -Uz compinit
compinit
autoload -U colors; colors
autoload -Uz add-zsh-hook
autoload -Uz select-word-style
select-word-style default 
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|' # ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

##  environment variables
source_shell $zsh_dir/env_vars.zsh

##  自作メソッド
source_shell $zsh_dir/my_function.zsh

## keybind
source_shell $zsh_dir/keybind.zsh

##  自作ウィジェット
source_shell $zsh_dir/my_widgets.zsh

## edit with editor on command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# cdr
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
 
# cdr の設定
# zstyle ':completion:*:*:cdr:*:*' menu selection
# zstyle ':completion:*:*:cdr:*:*' menu select
# zstyle ':completion:*' menu selection
# zstyle ':completion:*' menu select
zstyle ':completion:*' completer _oldlist _complete _expand
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
[ -d "$HOME/.cache/shell" ] || mkdir -p $HOME/.cache/shell
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

## オプション

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[.]=**'
zstyle ':completion:*' ignore-parents parent pwd ..

setopt no_beep
# setopt auto_cd
setopt auto_pushd
setopt CHASE_LINKS    # リンクへ移動するとき実体へ移動
setopt auto_param_keys
setopt auto_menu      # 複数の補完候補は一覧表示
setopt list_types     # 補完時にファイルの種別をマーク表示
setopt auto_list      # 補完候補は一覧表示
setopt list_packed    # 補完候補を詰めて表示
setopt extended_history
setopt share_history
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt notify
# setopt correct
setopt mark_dirs
setopt magic_equal_subst    # = の後をパス名として補完
setopt auto_param_slash
setopt noautoremoveslash
# unsetopt autoremoveslash
setopt list_types
setopt hist_verify
setopt complete_in_word

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  # 以下の条件をすべて満たすものだけをヒストリに追加する
  [[ ${#line} -ge 1
    && ${cmd} != (m|man)
    && ${cmd} != (users)
    && ${cmd} != (last|lastlog)
  ]]
}

##  エイリアス
source_shell $zsh_dir/alias.zsh

##  plugins
source_shell $zsh_dir/plugins.zsh
if [ $? != 0 ]; then
  echo; echo "$fg[red]not found plugins manager file$reset_color"
fi

## load PATH
source_shell $HOME/.dotfiles/shell.conf.d/path.bash

#
##  LEFT PROMPT
#
# local simple_prompt=$zsh_dir/zsh_simple_prompt
# local prompt=$zsh_dir/left_prompt.zsh
#if [ "$TERM" = linux ] ; then
#  [ -e $simple_prompt ] && source $simple_prompt
#else
#  [ -e $prompt ] && source $prompt
#fi

# PROMPT="%{[38;5;012m%}%#%{[0m%} "

#
## RIGHT PROMPT
#
#local rprompt=$zsh_dir/right_prompt.zsh
#[ -e $rprompt ] && source $rprompt

#
## coloring on man command
#
export MANPAGER='less -R'
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

## slarized
type dircolors > /dev/null 2>&1 && eval $(dircolors $HOME/.solarized/dircolors.256dark)

## set color when completion
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

## fzf path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo loading starship
## load starship
if type starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG=~/.dotfiles/starship/starship.toml
fi
