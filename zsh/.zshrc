##  環境設定
autoload -Uz compinit
compinit
autoload -U colors; colors
autoload -Uz add-zsh-hook

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##  オプション

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

setopt no_beep
# setopt auto_cd


##  エイリアス

alias ztime='time(zsh -i -c exit)'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias e='emacs'
alias v='vim'
alias gs='git status'
alias gr='git reflog'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset'"
alias gin='git init'
alias gre='git remote'
alias grad='git remote add'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias grs='git reset'
alias grv='git revert'
alias gt='git tag'
alias gtl='git tag -l'
alias gta='git tag -a'
alias gtn='git tag -n'
alias gtd='git tag -d'
alias gpush='git push'
alias gp='git pull'
alias gb='git branch'
alias gbd='git branch -d'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gap='git apply'
alias gapr='git apply -R'
alias gst='git stash'
alias gsk='git stash -k'
alias gsu='git stash -u'
alias gsl='git stash list'
# alias gsv='git stash save'
alias gslp='git stash list -p'
alias gss='git stash show'
alias gssp='git stash show -p'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gspop='git stash pop'
alias gsbr='git stash branch'
alias bdl='bundle'
alias be='bundle exec'
alias railss='rails s -b 0.0.0.0'
alias vag='vagrant'
alias sudoi='sudo -i'
alias tx='tmux'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tkill='tmux kill-session'
alias tkillserver='tmux kill-server'
alias viewcolor='for c in {000..255}; do echo -n "[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done'
alias backcolor='for c in {000..255}; do echo -n "[30;48;5;${c}m $c" ; [ $(($c%36)) -eq 35 ] && echo;done'
# alias u='$(git )'


##  zplug

export ZPLUG_HOME=$HOME/.dotfiles/zsh/plugins/.zplug
local zplug_init=$ZPLUG_HOME/init.zsh
local zplug_property=$HOME/.dotfiles/zsh
if [[ $zplug_init ]]; then
  source $zplug_property/zplug_load.zsh
else
  echo "not found zplug directory"
fi

##  プロンプト

# local simple_prompt=$zsh_dir/zsh_simple_prompt
local prompt=$HOME/.dotfiles/zsh/left_prompt.zsh

if [ "$TERM" = linux ] ; then
  [ -e $simple_prompt ] && source $simple_prompt
else
  [ -e $prompt ] && source $prompt
fi

local rprompt=$HOME/.dotfiles/zsh/right_prompt.zsh
[ -e $rprompt ] && source $rprompt
