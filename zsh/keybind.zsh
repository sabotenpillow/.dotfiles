# bindkey -e
# bindkey -v
# source $HOME/.dotfiles/zsh/show-vimode

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
# bindkey -M viins 'jj'  vi-cmd-mode
# has_keymap "vivis" && bindkey -M vivis 'jj' vi-visual-exit

# Merge emacs mode to viins mode
# bindkey -M viins '\er' history-incremental-pattern-search-forward
# bindkey -M viins '^?'  backward-delete-char
# bindkey -M viins '^A'  beginning-of-line
# bindkey -M viins '^B'  backward-char
# bindkey -M viins '^D'  delete-char-or-list
# bindkey -M viins '^E'  end-of-line
# bindkey -M viins '^F'  forward-char
# bindkey -M viins '^G'  send-break
# bindkey -M viins '^H'  backward-delete-char
# bindkey -M viins '^K'  kill-line
# bindkey -M viins '^N'  down-line-or-history
# bindkey -M viins '^P'  up-line-or-history
# bindkey -M viins '^R'  history-incremental-pattern-search-backward
# bindkey -M viins '^U'  backward-kill-line
# bindkey -M viins '^W'  backward-kill-word
# bindkey -M viins '^Y'  yank

# Make more vim-like behaviors
# bindkey -M vicmd 'gg' beginning-of-line
# bindkey -M vicmd 'G'  end-of-line

# https://github.com/zsh-users/zsh-history-substring-search
# has_widgets 'history-substring-search-up' &&
#   bindkey -M emacs '^P' history-substring-search-up
# has_widgets 'history-substring-search-down' &&
#   bindkey -M emacs '^N' history-substring-search-down
# 
# has_widgets 'history-substring-search-up' &&
#   bindkey -M viins '^P' history-substring-search-up
# has_widgets 'history-substring-search-down' &&
#   bindkey -M viins '^N' history-substring-search-down
# 
# has_widgets 'history-substring-search-up' &&
#   bindkey -M vicmd 'k' history-substring-search-up
# has_widgets 'history-substring-search-down' &&
#   bindkey -M vicmd 'j' history-substring-search-down

# bindkey "^[u" undo
# bindkey "^[r" redo
