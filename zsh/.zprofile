autoload -U colors; colors
# black, red, green, yellow, blue, magenta, cyan, white

echo # blank line for delimiter

echo "${fg[cyan]}===== login users =====${reset_color}";
users; echo

if [ `which tmux` ]; then
  echo "${fg[green]}===== tmux sessions =====${reset_color}";
  tmux ls; echo
fi

if [ `which vagrant` ]; then
  running_vms=`vagrant global-status | grep running`
  # if [ $? -eq 0 ]; then
  if ! [ -z running_vms ]; then
    echo "${fg[magenta]}===== running VMs =====${reset_color}";
    echo $running_vms; echo
  fi
  # echo "${fg[magenta]}===== running VMs =====${reset_color}";
  # ! [ -z running_vms ] && echo test
fi
