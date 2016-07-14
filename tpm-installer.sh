if ! [ -d tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm ~/.dotfiles/tmux/plugins/tpm
else
  echo 'already cloned tpm'
fi
