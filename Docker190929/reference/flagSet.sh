#!/bin/bash
redis-server --daemonize yes
service ssh start
service cron start
cd /root
gcc getflag.c -o getflag
chmod u+s getflag
mkdir /home/test/test
chown test:test /home/test/test
mv writable.sh /home/test/writable.sh
chmod 744 /home/test/writable.sh
chmod 777 /home/test/test
chmod 777 /home/test
echo "* * * * * cd /home/test;./writable.sh" > /var/spool/cron/crontabs/root
chmod 0600 /var/spool/cron/crontabs/root
service cron restart
umask 000

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



