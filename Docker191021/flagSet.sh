#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)

sed -i 's/0/abxxxxxxxx/' threekingdoms
sed -i 's/1/bcxxxxxxxx/' threekingdoms
sed -i 's/2/cdxxxxxxxx/' threekingdoms
sed -i 's/3/dexxxxxxxx/' threekingdoms
sed -i 's/4/efxxxxxxxx/' threekingdoms
sed -i 's/5/fgxxxxxxxx/' threekingdoms
sed -i 's/6/ghxxxxxxxx/' threekingdoms
sed -i 's/7/hixxxxxxxx/' threekingdoms

a=`echo $flagCont | cut -c 1`
sed -i 's/abxxxxxxxx/'$a'/' threekingdoms
b=`echo $flagCont | cut -c 2`
sed -i 's/bcxxxxxxxx/'$b'/' threekingdoms
c=`echo $flagCont | cut -c 3`
sed -i 's/cdxxxxxxxx/'$c'/' threekingdoms
d=`echo $flagCont | cut -c 4`
sed -i 's/dexxxxxxxx/'$d'/' threekingdoms
e=`echo $flagCont | cut -c 5`
sed -i 's/efxxxxxxxx/'$e'/' threekingdoms
f=`echo $flagCont | cut -c 6`
sed -i 's/fgxxxxxxxx/'$f'/' threekingdoms
g=`echo $flagCont | cut -c 7`
sed -i 's/ghxxxxxxxx/'$g'/' threekingdoms
h=`echo $flagCont | cut -c 8`
sed -i 's/hixxxxxxxx/'$h'/' threekingdoms

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
#nc -l -p $portnum -e /bin/bash
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



