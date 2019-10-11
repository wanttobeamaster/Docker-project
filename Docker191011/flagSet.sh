#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
portnum=$(date +%s%N|cut -c11-16)
echo $flagCont > /root/flag.txt

nc -l -p $portnum -e /bin/bash

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



