function git-replace
  if [ (count $argv) != 2 ];
    echo 'Set an argument! or too many!'
    return 1
  end
  git grep -l $argv[1] | xargs sed -i -e "s/$argv[1]/$argv[2]/g"
end
