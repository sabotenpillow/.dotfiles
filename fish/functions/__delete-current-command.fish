function __delete-current-command
  commandline -f beginning-of-line
  commandline -f kill-bigword
  # commandline -f forward-char
  # set -l get_token (commandline -t)
  # echo (string length $get_token)
  # echo
  # echo $get_token
  # if [ (string length $get_token) = 1 ];
  #   # commandline -f delete-char
  # else
  #   commandline -f kill-bigword
  # end
end
