#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt

chmod 775 /tmp/cron_script.sh
service cron start
echo "* * * * * cd /tmp;./cron_script.sh" > /var/spool/cron/crontabs/root
chmod 0600 /var/spool/cron/crontabs/root

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
service cron restart
echo "123" > /home/test/123.txt
#nc -l -p $portnum -e /bin/bash
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



