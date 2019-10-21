#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
portnum=$(date +%s%N|cut -c13-16)
portnum=`expr $portnum+24`
echo $flagCont > /root/flag.txt

rm -f /etc/alternatives/nc && ln -s /bin/nc.traditional /etc/alternatives/nc
iptables -A INPUT -i eth0 -p tcp --dport ssh -j DROP
iptables -A INPUT -i lo -p tcp --dport ssh -j DROP


connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
#nc -l -p $portnum -e /bin/bash
if [ "$connectRes" = 'OK' ]
then
/bin/bash;nc -l -k -p $portnum -e /bin/bash
else
echo "Connection Failed";nc -l -k -p $portnum -e /bin/bash
fi
tail -f /dev/null



