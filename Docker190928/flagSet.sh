#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt
pyinstaller -F getflag.py
rm -f /home/test/getflag.py
chmod 777 /home/test/dist/getflag
chmod u+s /home/test/dist/getflag
chmod 777 /etc/hosts

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



