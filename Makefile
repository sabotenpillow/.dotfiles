SHELL := /bin/bash
.PHONY: zsh tig tmux fish
temp:
	@echo If you want help, type '`make help`'

## configuration
fish:
	mkdir -p $HOME/.config/fish/
	ln -vfs $HOME/.dotfiles/fish/config.fish  $HOME/.config/fish/
	ln -vs  $HOME/.dotfiles/fish/functions    $HOME/.config/fish/
zsh:
	ln -vfs .dotfiles/zsh/.zshrc    ~/
	ln -vfs .dotfiles/zsh/.zshenv   ~/
	ln -vfs .dotfiles/zsh/.zprofile ~/
	ln -vfs .dotfiles/zsh/.zlogout  ~/
any: tmux tig gem less most
tmux:
	ln -vfs .dotfiles/tmux/.tmux.conf ~/
tig:
	ln -vfs .dotfiles/tig/.tigrc ~/
gem:
	ln -vfs .dotfiles/.gemrc ~/
less:
	ln -vfs .dotfiles/.lesskey ~/
most:
	ln -vfs .dotfiles/.mostrc ~/

## clean configuration
clean-zsh:
	-unlink ~/.zshrc
	-unlink ~/.zshenv
	-unlink ~/.zprofile
	-unlink ~/.zlogout
clean-fish:
	-unlink $HOME/.config/fish/config.fish
	-unlink $HOME/.config/fish/function
clean-tmux:
	unlink .dotfiles/tmux/.tmux.conf
clean-tig:
	unlink .dotfiles/tig/.tigrc
clean-gem:
	unlink .dotfiles/.gemrc
clean-less:
	unlink .dotfiles/.lesskey
clean-most:
	unlink .dotfiles/.mostrc

## other
git:
	git config --global core.editor vim
	git config --global color.ui true
	git config --global color.diff true
	git config --global push.default current
	git config --global pull.default current
brew:
	# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
	ruby -e "`curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install`"
	brew install caskroom/cask/brew-cask
solarized:
	git clone git@github.com:seebi/dircolors-solarized.git ~/.solarized
tpm:
	@if ! [ -d tmux/plugins/tpm ]; then \
		git clone git@github.com:tmux-plugins/tpm ~/.dotfiles/tmux/plugins/tpm; \
	else \
		echo 'already cloned tpm'; \
	fi
zplug:
	curl -sL zplug.sh/installer | zsh
fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cdr:
	mkdir -p ~/.cache/shell
