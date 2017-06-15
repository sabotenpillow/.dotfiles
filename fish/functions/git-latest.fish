function git-latest
  if [ (count $argv) = 0 ];
    set num 10
  else
    set num $argv
    # $num = $argv
  end
  git ls-files | xargs ls -alt 2> /dev/null | head -n $num
end
