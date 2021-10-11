### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

#*********************************************************
#               PLUGIN INSTALLATION
#*********************************************************

# zinit light "zsh-users/zsh-syntax-highlighting"
# zinit light "b4b4r07/enhancd"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zdharma/fast-syntax-highlighting"
zinit light "momo-lab/zsh-abbrev-alias"
zinit light "rupa/z"

function loaded() {
  echo $1
  zinit loaded | grep $1
  return $?
}

## enhancd
# export ENHANCD_FILTER=fzf-tmux
# export ENHANCD_FILTER=peco:fzf

## autosuggestions
bindkey '^[i' autosuggest-accept
bindkey '^[m' autosuggest-execute

##  momo-lab/zsh-abbrev-alias
abbrev-alias -g G="|grep"
abbrev-alias -g d="docker"
abbrev-alias -g gs="git status"
abbrev-alias -g gd="git diff"
abbrev-alias -g ga="git add"
abbrev-alias -g gc="git commit -m"
abbrev-alias -g gp="git pull"
