function __prevd-or-backward-char
  set -l get_line (commandline -b)
  if [ (string length $get_line) = 0 ]
    # commandline -f prevd
    prevd
    commandline -f repaint
  else
    commandline -f backward-char
  end
end
