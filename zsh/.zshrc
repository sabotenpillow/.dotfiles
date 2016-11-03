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

#
##  自作メソッド
#
local my_function_path=$HOME/.dotfiles/zsh/my_function.zsh
if [[ -e $my_function_path ]] ; then
  source $my_function_path
fi

## bindkey

# bindkey -e
bindkey -v
source $HOME/.dotfiles/zsh/show-vimode

bindkey "^@" set-mark-command
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^F" forward-char
bindkey "^G" send-break
bindkey "^H" backward-delete-char
bindkey "^I" expand-or-complete
bindkey "^J" accept-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^M" accept-line
bindkey "^N" down-line-or-history
bindkey "^O" accept-line-and-down-history
bindkey "^P" up-line-or-history
bindkey "^Q" push-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^T" transpose-chars
bindkey "^U" kill-whole-line
bindkey "^V" quoted-insert
bindkey "^W" backward-kill-word
bindkey "^X^B" vi-match-bracket
bindkey "^X^F" vi-find-next-char
bindkey "^X^J" vi-join
bindkey "^X^K" kill-buffer
bindkey "^X^N" infer-next-history
bindkey "^X^O" overwrite-mode
bindkey "^X^R" _read_comp
bindkey "^X^U" undo
bindkey "^X^V" vi-cmd-mode
bindkey "^X^X" exchange-point-and-mark
bindkey "^X*" expand-word
bindkey "^X=" what-cursor-position
bindkey "^X?" _complete_debug
bindkey "^XC" _correct_filename
bindkey "^XG" list-expand
bindkey "^Xa" _expand_alias
bindkey "^Xc" _correct_word
bindkey "^Xd" _list_expansions
bindkey "^Xe" _expand_word
bindkey "^Xg" list-expand
bindkey "^Xh" _complete_help
bindkey "^Xm" _most_recent_file
bindkey "^Xn" _next_tags
bindkey "^Xr" history-incremental-search-backward
bindkey "^Xs" history-incremental-search-forward
bindkey "^Xt" _complete_tag
bindkey "^Xu" undo
bindkey "^Y" yank
bindkey "^[^D" list-choices
bindkey "^[^G" send-break
bindkey "^[^H" backward-kill-word
bindkey "^[^I" self-insert-unmeta
bindkey "^[^J" self-insert-unmeta
bindkey "^[^L" clear-screen
bindkey "^[^M" self-insert-unmeta
bindkey "^[^_" copy-prev-word
bindkey "^[ " expand-history
bindkey "^[!" expand-history
bindkey "^[\"" quote-region
bindkey "^[\$" spell-word
bindkey "^['" quote-line
bindkey "^[," _history-complete-newer
bindkey "^[-" neg-argument
bindkey "^[." insert-last-word
bindkey "^[/" _history-complete-older
bindkey "^[0" digit-argument
bindkey "^[1" digit-argument
bindkey "^[2" digit-argument
bindkey "^[3" digit-argument
bindkey "^[4" digit-argument
bindkey "^[5" digit-argument
bindkey "^[6" digit-argument
bindkey "^[7" digit-argument
bindkey "^[8" digit-argument
bindkey "^[9" digit-argument
bindkey "^[<" beginning-of-buffer-or-history
bindkey "^[>" end-of-buffer-or-history
bindkey "^[?" which-command
bindkey "^[A" accept-and-hold
bindkey "^[B" backward-word
bindkey "^[C" capitalize-word
bindkey "^[D" kill-word
bindkey "^[F" forward-word
bindkey "^[G" get-line
bindkey "^[H" run-help
bindkey "^[L" down-case-word
bindkey "^[N" history-search-forward
bindkey "^[OA" up-line-or-history
bindkey "^[OB" down-line-or-history
bindkey "^[OC" forward-char
bindkey "^[OD" backward-char
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[P" history-search-backward
bindkey "^[Q" push-line
bindkey "^[S" spell-word
bindkey "^[T" transpose-words
bindkey "^[b" backward-word
bindkey "^[d" kill-word
bindkey "^[f" forward-word
# bindkey "^[l" down-case-word

# Easy to escape
bindkey -M viins 'jj'  vi-cmd-mode
has_keymap "vivis" && bindkey -M vivis 'jj' vi-visual-exit

# Merge emacs mode to viins mode
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

# Make more vim-like behaviors
bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G'  end-of-line

# https://github.com/zsh-users/zsh-history-substring-search
has_widgets 'history-substring-search-up' &&
  bindkey -M emacs '^P' history-substring-search-up
has_widgets 'history-substring-search-down' &&
  bindkey -M emacs '^N' history-substring-search-down

has_widgets 'history-substring-search-up' &&
  bindkey -M viins '^P' history-substring-search-up
has_widgets 'history-substring-search-down' &&
  bindkey -M viins '^N' history-substring-search-down

has_widgets 'history-substring-search-up' &&
  bindkey -M vicmd 'k' history-substring-search-up
has_widgets 'history-substring-search-down' &&
  bindkey -M vicmd 'j' history-substring-search-down


#
##  自作ウィジェット
#
local my_widget_path=$HOME/.dotfiles/zsh/my_widgets.zsh
if [[ -e $my_widget_path ]] ; then
  source $my_widget_path
fi

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
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

## オプション

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
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

#
##  エイリアス
#
local alias_path=$HOME/.dotfiles/zsh/alias.zsh
if [[ -e $alias_path ]] ; then
  source $alias_path
fi

#
##  zplug
#
export ZPLUG_HOME=$HOME/.zplug
local zplug_init=$ZPLUG_HOME/init.zsh
local zplug_property=$HOME/.dotfiles/zsh
if [[ -e $zplug_init ]] ; then
  source $zplug_property/zplug_load.zsh
else
  echo; echo "$fg[red]not found zplug directory$reset_color"
fi

#
##  LEFT PROMPT
#
# local simple_prompt=$zsh_dir/zsh_simple_prompt
local prompt=$HOME/.dotfiles/zsh/left_prompt.zsh

if [ "$TERM" = linux ] ; then
  [ -e $simple_prompt ] && source $simple_prompt
else
  [ -e $prompt ] && source $prompt
fi

# PROMPT="%{[38;5;012m%}%#%{[0m%} "

#
## RIGHT PROMPT
#
local rprompt=$HOME/.dotfiles/zsh/right_prompt.zsh
[ -e $rprompt ] && source $rprompt

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
eval $(dircolors $HOME/.solarized/dircolors.256dark)

## set color when completion
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

## fzf path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
