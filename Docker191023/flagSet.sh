#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /root/flag.txt

chmod 777 /root/getflag
chmod 777 /home/test/
chmod 775 /home/test/flag.lua
chmod 777 /home/test/lua-5.3.0.tar.gz

tar -zxf lua-5.3.0.tar.gz
apt-get update
apt-get -y install libreadline6 libreadline6-dev
cd lua-5.3.0
make linux test
make install
ln -s ./src/lua /usr/bin/lua

cd /home/test
git clone  https://github.com/diegonehab/luasocket
cd luasocket
make
make install-both-unix
cd /home/test

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash;lua flag.lua
else
echo "Connection Failed";lua flag.lua
fi
tail -f /dev/null



