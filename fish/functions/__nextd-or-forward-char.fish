function __nextd-or-forward-char
  set -l get_line (commandline -b)
  if [ (string length $get_line) = 0 ]
    # command nextd
    nextd
    commandline -f repaint
  else
    commandline -f forward-char
  end
end
