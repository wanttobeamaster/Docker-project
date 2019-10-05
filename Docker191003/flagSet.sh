#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt

#set the right of user
chown "test:test" /home/test
chmod 777 /home/test
chown "flag:flag" /home/flag
chmod 775 /home/flag

#set the right of read flag.txt 
cp -r /root/flag.txt /home/flag
chmod 700 /home/flag/flag.txt
chown "flag:flag" /home/flag/flag.txt

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



