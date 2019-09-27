#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /home/flag/flag.txt
chown flag:flag /home/flag/flag.txt
chmod 770 /home/flag/flag.txt
chmod 777 /home/test
cat /etc/passwd | grep flag > /home/test/passwd.txt
cat /etc/shadow | grep flag > /home/test/shadow.txt

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



