function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}

function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}
