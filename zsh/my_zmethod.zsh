function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}

function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}

# Helper function
# use 'zle -la' option
# zsh -la option returns true if the widget exists
has_widgets() {
  if [[ -z $1 ]]; then
    return 1
  fi
  zle -la "$1"
  return $?
}

# Helper function
# use bindkey -l
has_keymap() {
  if [[ -z $1 ]]; then
    return 1
  fi
  bindkey -l "$1" >/dev/null 2>&1
  return $?
}
