SHELL := /bin/bash
uname_os := $(shell uname -s)
.PHONY: os zsh tig tmux fish karabiner warp vscode
temp:
	@echo If you want help, type '`make help`'
os:
ifeq ($(uname_os),Darwin)
	$(eval os=mac)
else ifeq ($(uname_os),Linux)
	$(eval os=linux)
endif

## configuration
bash: bash/.bash_profile bash/.bashrc
	ln -vfs ${HOME}/.dotfiles/bash/.bash_profile ~
	ln -vfs ${HOME}/.dotfiles/bash/.bashrc       ~
fish: bash
	mkdir -p ~/.config/fish/
	ln -vfs ${HOME}/.dotfiles/fish/config.fish  ~/.config/fish/
	ln -vs  $(HOME)/.dotfiles/fish/functions    ~/.config/fish/
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
vscode: os
	$(if $(shell test $(os) = "mac" && echo 1), \
		$(eval path=~/Library/Application\ Support/Code/User) \
		, \
		$(eval path=~/.config/Code/User) \
	)
# ifeq ($(uname_os),Darwin)
# 	$(eval path=~/Library/Application\ Support/Code/User)
# else
# 	$(eval path=~/.config/Code/User)
# endif
	mkdir -p $(path)
	ln -vfs ~/.dotfiles/vscode/settings.json $(path)/settings.json
	ln -vfs ~/.dotfiles/vscode/keybindings.json $(path)/keybindings.json


## clean configuration
clean-zsh:
	-unlink ~/.zshrc
	-unlink ~/.zshenv
	-unlink ~/.zprofile
	-unlink ~/.zlogout
clean-fish:
	-unlink ~/.config/fish/config.fish
	-unlink ~/.config/fish/functions
clean-tmux:
	unlink ~/.tmux.conf
clean-tig:
	unlink ~/.tigrc
clean-gem:
	unlink ~/.gemrc
clean-less:
	unlink ~/.lesskey
clean-most:
	unlink ~/.mostrc

## other
git:
	git config --global core.editor vim
	git config --global color.ui true
	git config --global color.diff true
	git config --global push.default current
	git config --global pull.default current
linuxbrew:
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
oh-my-fish:
	curl -L https://get.oh-my.fish | fish
fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cdr:
	mkdir -p ~/.cache/shell

## on Mac environment
karabiner:
	ln -vfs ~/.dotfiles/karabiner/assets/complex_modifications/*.json ~/.config/karabiner/assets/complex_modifications
warp:
	mkdir -p ~/.warp && ln -vfs ~/.dotfiles/warp/keybindings.yaml ~/.warp
mac:
	defaults write -g ApplePressAndHoldEnabled -bool false

## version management
anyenv:
	git clone https://github.com/riywo/anyenv ~/.anyenv
	exec $(SHELL) -l
pyenv:
	-git clone https://github.com/yyuu/pyenv.git ~/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
rbenv:
	[ -d $(HOME)/.rbenv ] || (echo "[38;5;190mcloning rbenv [0m"; \
		git clone https://github.com/sstephenson/rbenv.git ~/.rbenv)
	[ -d $(HOME)/.rbenv/plugins/ruby-build ] || \
		echo "[38;5;190mcloning ruby-build [0m"; \
		git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
nvm:
	git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
gvm:
	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

gcloud:
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
	sudo apt-get update && sudo apt-get install google-cloud-sdk
	gcloud init
