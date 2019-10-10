#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /home/flag10/token

chown "test:test" /home/test
chmod 777 /home/test
chown "flag10:flag10" /home/flag10
chmod 775 /home/flag10
chown "flag10:flag10" /home/flag10/*
chmod 775 /home/flag10/demo
chmod u+s /home/flag10/demo
chmod 770 /home/flag10/token
chmod 775 /home/flag10/demo.c

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



