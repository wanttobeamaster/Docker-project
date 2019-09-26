#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt
pyinstaller -F God.py
chmod 777 /home/test
chmod 777 /home/test/dist/God
chmod u+s /home/test/dist/God
rm -f God.py
chmod 000 /home/test/flag.txt

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



