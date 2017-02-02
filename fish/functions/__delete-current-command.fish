function __delete-current-command
  commandline -f beginning-of-line
  commandline -f kill-bigword
end
