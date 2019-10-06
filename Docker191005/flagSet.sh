#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /home/flag/flag.txt

chown "test:test" /home/test
chmod 777 /home/test
gcc /home/test/getflag.c -o /home/test/getflag
rm -f /home/test/getflag.c
chmod 775 /home/test/getflag
chmod 775 /home/test/getflag_main.c

chown "flag:flag" /home/flag
chmod 775 /home/flag
chown "flag:flag" /home/flag/flag.txt
chmod 500 /home/flag/flag.txt


connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null


