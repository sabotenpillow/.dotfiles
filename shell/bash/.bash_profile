[ -e ~/.bashrc ] && source ~/.bashrc

# switch shell to fish if login shell is bash
which fish > /dev/null && exec fish
