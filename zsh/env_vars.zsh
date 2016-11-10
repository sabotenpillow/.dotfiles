## get IP address
if [ `which cut` ] && [ $SSH_CONNECTION ] ; then
  export IP_ADDRESS=`echo $SSH_CONNECTION | cut -f3 -d ' '`
# elif [ `which nslookup` ] && [ `which hostname` ] ; then
#   export IP_ADDRESS=`nslookup \`hostname\` | grep Address | tail -n +2 | cut -f2 -d ' '`
fi

export LESS='-iMR'
# src-highlight-path="`which src-hilite-lesspipe.sh`"
# export LESSOPEN="| ${src-highlight-path} %s"

export LANG=en_US.UTF-8
