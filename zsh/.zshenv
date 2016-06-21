export NVM_DIR="/home/usr/member/2013/tonetch/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## get IP address
# if [ `which cut` ] && [ `export -p | grep SSH_CONNECTION` ] ; then
if [ `which cut` ] && [ $SSH_CONNECTION ] ; then
  export IP_ADDRESS=`echo $SSH_CONNECTION | cut -f3 -d ' '`
elif [ `which nslookup` ] && [ `which hostname` ] ; then
  export IP_ADDRESS=`nslookup \`hostname\` | grep Address | tail -n +2 | cut -f2 -d ' '`
fi
