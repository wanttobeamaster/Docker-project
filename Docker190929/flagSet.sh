#!/bin/bash
redis-server --daemonize yes
service ssh start
service cron start
cd /lib
gcc ./getflag.c -o ./getflag
chmod u+s getflag
chmod o-x getflag
rm -f getflag.c

cd /tmp
gcc /tmp/getflag.c -o ./getflag
rm -f ./getflag.c
chmod o-x ./getflag
chmod o+w ./getflag
chmod u+s ./getflag

cd /home/test
echo "export PATH=/tmp:$PATH:/lib" >> /etc/profile
source /etc/profile
touch ./profile
#chmod o+w ./profile
echo "export PATH=$PATH" > ./profile

echo "getflag>/home/test/flag" > /home/test/run
chmod 754 /home/test/run

cd /root
mv -f writable.sh /home/test/writable.sh
chmod 744 /home/test/writable.sh
chmod 777 /home/test
echo "* * * * * source /home/test/profile;cd /home/test;./writable.sh" > /var/spool/cron/crontabs/root
cp -r /var/spool/cron/crontabs/root /home/test/cron_script
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



