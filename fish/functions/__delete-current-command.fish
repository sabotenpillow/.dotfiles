function __delete-current-command
  set -l get_commandline (commandline)
  set -l arguments ' ' (string split --max 1 ' ' $get_commandline)[2]
  commandline -r (string join '' $arguments)
  commandline -f beginning-of-line
end
