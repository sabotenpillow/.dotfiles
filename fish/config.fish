set fish_dir $HOME/.dotfiles/fish

# set -gx LS_COLORS (dircolors $HOME/.solarized/dircolors.256dark)

source $fish_dir/ls.fish
source $fish_dir/bind.fish
source $fish_dir/git_prompt.fish
# source $fish_dir/fish-git/completions/git.fish
# source $fish_dir/fish-git/functions/prompt_git.fish
# source $fish_dir/right_prompt.fish

# source $fish_dir/alias.fish
#
##  alias
#
# alias ls 'ls --color auto'
alias sl 'ls'
alias l 'ls'
alias la 'ls -A'
alias ll 'ls -l'
alias lla 'ls -lA'
alias lr 'ls -R'
alias grep 'grep --color auto'
alias e 'emacs'
alias v 'vim'
alias vr 'vim -R'
alias vb 'vim -b'
alias gg 'git grep'
alias gs 'git status'
alias gm 'git merge'
alias gls 'git ls-files'
alias gd 'git diff'
alias gl "git log --graph --pretty format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset'"
alias gin 'git init'
alias gre 'git remote'
alias grad 'git remote add'
alias ga 'git add'
alias gaaaa 'git add -A'
alias gc 'git commit -m'
alias gca 'git commit --amend'
alias grs 'git reset'
alias grshard 'git reset --hard'
alias grv 'git revert'
alias gps 'git push'
alias gp 'git pull'
alias gb 'git branch'
alias gbd 'git branch -d'
alias gbm 'git branch -m'
alias gch 'git checkout'
alias gcb 'git checkout -b'
alias gcp 'git cherry-pick'
