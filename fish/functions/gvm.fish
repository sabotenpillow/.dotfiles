if test -d $HOME/.gvm
  if type bass > /dev/null 2>&1
    function gvm
      bass source ~/.gvm/scripts/env/gvm ';' gvm $argv
    end
  else
    warning_echo 'cyan' 'install oh-my-fish & edc/bass!!!'
  end
end
