## Docker12:iptables+nc
* finish in 191019
* Question:
    - after compile,the string send to 172.17.0.2,will add the "b'xxxx'".if you want to use it,you have to add string.decode()
    - the eth0 and lo is different ip in iptables
    - the port states have many type,they can transform to others type via the operation,you can learn it from a pic
* __Introduction:__  
first,run ./getflag,and open another windows,input "nc localhost 1024 -p 65535",if the first window output "rand=2",you should reopen this window,and clear the port states by the flow of below picture.repeat it ,untill the first window output nothing,then you can input "isme" in the second window,you will get the flag  
![port states transform 图标](https://img-blog.csdn.net/20140705165548125?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvempzeWhqaA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)  

