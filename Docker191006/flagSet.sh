#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt

pyinstaller -F getflag.py

mv -f /home/test/dist/getflag /home/test/getflag
rm -rf /home/test/build dist
rm -f /home/test/getflag.spec

chmod 755 /home/test/getflag
chmod 755 /home/test/getflag.py
chmod u+s getflag

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



