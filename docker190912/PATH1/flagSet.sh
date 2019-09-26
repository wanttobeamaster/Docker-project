#!/bin/bash
redis-server --daemonize yes
service ssh start
cd /home/test
gcc demo.c -o demo
chmod u+s demo
chmod 744 demo.c
chown test:test /home/test

flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt
connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



