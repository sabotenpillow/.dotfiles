function warning_echo
  # if [ (count $argv) < 2 ];
  #   return 1
  # end
  set_color $argv[1]
  echo $argv[2]
  set_color normal
end
