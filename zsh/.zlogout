echo

if [ `which vagrant` ]; then
  running_vms=`vagrant global-status | grep running`
  # if [ $? -eq 0 ]; then
  if ! [ -z running_vms ]; then
    echo ${fg[red]}===== VM is running =====${reset_color};
    echo $running_vms; echo
  fi
  # echo ${fg[magenta]}===== running VMs =====${reset_color};
  # ! [ -z running_vms ] && echo test
fi
