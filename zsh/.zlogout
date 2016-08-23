echo

if [ `which vagrant` ]; then
  # running_vms=`vagrant global-status | grep running`
  vms_process=`ps x | grep virtualbox | grep VBoxHeadless`  # ps x G virtualbox G VBoxHeadless | cut -d ' ' -f17
  if [ $? -eq 0 ]; then
  # if ! [ -z vms_process ]; then
    echo "${fg[red]}===== VM is running =====${reset_color}";
    echo "$vms_process" | sed -re 's/ +/ /g' | cut -d ' ' -f7; echo
  fi
  # if ! [ -z running_vms ]; then
  #   echo "${fg[red]}===== VM is running =====${reset_color}";
  #   echo $running_vms; echo
  # fi
  # echo "${fg[magenta]}===== running VMs =====${reset_color}";
  # ! [ -z running_vms ] && echo test
fi
