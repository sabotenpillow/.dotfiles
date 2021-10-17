autoload -U colors; colors
# black, red, green, yellow, blue, magenta, cyan, white

echo # blank line for delimiter

echo "${fg[cyan]}===== login users =====${reset_color}";
users; echo

if type tmux > /dev/null 2>&1; then
  echo "${fg[green]}===== tmux sessions =====${reset_color}";
  tmux ls; echo
fi

if type vagrant > /dev/null 2>&1; then
  # running_vms=`vagrant global-status | grep running`
  vms_process=`ps x | grep virtualbox | grep VBoxHeadless`  # ps x G virtualbox G VBoxHeadless | cut -d ' ' -f17
  if [ $? -eq 0 ]; then
  # if ! [ -z vms_process ]; then
    echo "${fg[magenta]}===== running VMs =====${reset_color}";
    echo "$vms_process" | sed -re 's/ +/ /g' | sed -re 's/^ //g' | cut -d ' ' -f7; echo
  fi
  # if ! [ -z running_vms ]; then
  #   echo "${fg[red]}===== VM is running =====${reset_color}";
  #   echo $running_vms; echo
  # fi
  # echo "${fg[magenta]}===== running VMs =====${reset_color}";
  # ! [ -z running_vms ] && echo test
fi

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
