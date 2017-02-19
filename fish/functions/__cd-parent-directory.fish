function __cd-parent-directory --description 'cd parent directory'
  set -l get_line (commandline -b)
  if [ (string length $get_line) = 0 ]
    cd ..
    commandline -f repaint
  end
end
