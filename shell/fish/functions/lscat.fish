function lscat --description '`ls` if directory, `cat` if file'
  if [ (count $argv) = 0 ];
    echo 'Set an argument! or too many!'
    return 1
  end
  for x in $argv
    warning_echo cyan " ---- $x ----"
    if test -d $x
      ls -A $x
    else
      cat $x
    end
    echo
  end
end
