#!/bin/bash
redis-server --daemonize yes
service ssh start
flagCont=$(date +%s%N|cut -c9-16)
echo $flagCont > /home/test/flag.txt

chown "test:test" /home/test
chmod 777 /home/test
# getpasswd.php
chmod 775 /home/test/getpasswd.php
# exec.py
pyinstaller -F exec.py
mv -f /home/test/dist/exec /home/test/exec
rm -rf /home/test/dist build exec.py
chmod 775 /home/test/exec
chmod u+s /home/test/exec
#exec_bp.py
chmod 775 /home/test/exec_bp.py
#flag.txt
chmod 770 /home/test/flag.txt 

connectRes=$(redis-cli -h $1 -p $2 -a $3 set "container_flag_$4_$5" $flagCont)
if [ "$connectRes" = 'OK' ]
then
/bin/bash
else
echo "Connection Failed"
fi
tail -f /dev/null



