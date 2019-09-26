#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt
shiftCont=$(($RANDOM%10))
echo $shiftCont > /tmp/shift.txt
chmod 744 /tmp/shift.txt
pyinstaller /home/test/123.py
gcc /root/enflag.c -o /root/enflag
/root/enflag > /home/test/flag
chmod 777 /home/test/flag
gcc /home/test/en.c -o /home/test/en
chmod 777 /home/test/en
chmod 777 /home/test/test.txt
rm -f /home/test/en.c

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



