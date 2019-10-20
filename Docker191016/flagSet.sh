#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt

chown "test:test" /home/test
chmod 777 /home/test
pyinstaller -F /home/test/getflag.py
mv -f /home/test/dist/getflag /home/test/getflag
rm -rf /home/test/dist build
chmod 775 /home/test/getflag
chmod u+s /home/test/getflag
chmod 775 /home/test/getflag.py

iptables -F
iptables -A INPUT -i eth0 -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 1024 -j DROP
iptables -A INPUT -i lo -p tcp --sport 1025:65534 -j DROP

iptables -L -n > /home/test/iptables_script
chmod 775 /home/test/iptables_script


connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



