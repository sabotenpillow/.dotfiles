### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d $ZINIT_HOME ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    mkdir -p "$(dirname $ZINIT_HOME)" && command chmod g-rwX "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
    command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#*********************************************************
#               PLUGIN INSTALLATION
#*********************************************************

# zinit light "zsh-users/zsh-syntax-highlighting"
# zinit light "b4b4r07/enhancd"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zdharma-continuum/fast-syntax-highlighting"
zinit light "momo-lab/zsh-abbrev-alias"
zinit light "rupa/z"
zinit light "jonmosco/kube-ps1"
# zinit light "asdf-vm/asdf"

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
abbrev-alias -g L="|less"
abbrev-alias -g H="|head"
abbrev-alias -g T="|tail"
abbrev-alias -g X="|xargs"
abbrev-alias -g W="|wc"
abbrev-alias -g d="docker"
abbrev-alias -g gs="git status"
abbrev-alias -g gd="git diff"
abbrev-alias -g ga="git add"
abbrev-alias -g gc="git commit -m"
abbrev-alias -g gp="git pull"
