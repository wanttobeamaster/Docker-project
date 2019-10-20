# DockerProject  
## Docker1:imagestobase64  
*introduction:*
*	this items is generate a random num and save the num in /root/flag.txt,at the initial of the container,the flag is encode to the base64 code,so the solution idea is copy the code and open the webpage and search how to translate a base64 code to a images*  
## Docker2:Right of a documents  
*finish in190926*  
*introduction:*
*	so,this items is about of the right of u,g,o,In the file /home/test,I create a 'flag.txt' and set its right as 000,you can not do nothing but delete it,so,if you know about it and delete it ,and then run ./dist/God,you will get the flag*  
## Docker3:john recieve the passwd  
*finish in 190927*  
*introduction:*
*	this is the third item,in this item,i set two ordinary usr,you can use "ssh test@Attacked ip and passwd:123 into the attacked system,then,you can see that the flag is in "/home/flag/flag.txt",you should obtain the passwd of the usr flag by john,you can study how to answer this question by visit <https://blog.csdn.net/frank_ldw/article/details/81261626>,"  
## Docker4:resolved domain to ip(地址解析)
*finish in 190929*  
*introduction:*
*	The 4th item is about of domain resolve,you should add "123.206.87.240 flag.baidu.com" to /etc/hosts,and then ,run /home/test/dist/getflag,you can get the flag  
## Docker5:crontab and PATH(定时任务)
*finish in 191003*  
*introduction:*
*	THis item is a litle diffcult,when you get into the container,you can see "run","profile","cron_script","writable",and then,the system will generate "flag".so,there 5 file in the file /home/test.you should analyze the relation about them.the relation about them is:"cron_script"-->"profile" and "writbale" -->"run"-->"flag",as you can see,there is a code "source /home/test/profile" in the "cron_script",this is the environment PATH os crontab.and the code "getflag" is in "run",so,we can think about where the getflag is,there is another diffcult point is that the linux PATH is not equal to crontabs PATH.so,copy the content and delete the "profile",create a new "profile" and paste the content,the most important step is you should delete "/tmp" in the contents.wait a moments,and you can see the flag.  
## Docker6:thefting the file by ssh(ssh免密码登陆)
*finish in 191005*  
*introduction:*
*	This item is recurrence the <https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level05%E2%80%94%E2%80%94%E7%AA%83%E5%8F%96%E6%9C%BA%E5%AF%86%E6%96%87%E4%BB%B6.org>,beside the dockerfile and flagset,after get into the container,it has two user,and flag.txt is in /home/flag/flag.txt,first,I generate the rsa of test,copy id_rsa.pub and save it in authorized_keys,the ssh into flag,create .ssh file,and save authorized_keys,id_rsa,id_rsa.pub(test) in .ssh,Then,backup .ssh.so,if you want to get the flag,you should tar the .backup/.xxxxx,and copy id_rsa and id_rsa.pub to /home/test/.ssh.finally,ssh flag@localhost,it will get into flag automatically.   
## Docker7:thefting the token again(gdb工具使用)
*finish in 191006*  
*introduction:*
* reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level13%E2%80%94%E2%80%94%E5%86%8D%E6%AC%A1%E7%AA%83%E5%8F%96token.org>,This item main use tool "gdb",the flag is hide in /home/flag/flag.txt,but only flag can read it,in the getflag,first compare whether current id equal 1000,if not,finish the program,and i show the main of the program,analyzing it,you will use the "gdb" to get the flag's passwd,"gdb getflag"-->"start"-->"disassemble main"-->"copy cmp address"-->"b *address"-->continue-->"set $eax=1000"-->"continue"-->got the passwd  
## Docker8:python pickle execute script(python的pickle漏洞利用)
*finish in 191009*  
*introduction:*
*  reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level17%E2%80%94%E2%80%94Python%E7%9A%84pickle%E6%A0%BC%E5%BC%8F%E5%8F%AF%E6%89%A7%E8%A1%8C%E8%84%9A%E6%9C%AC%E6%BC%8F%E6%B4%9E.org>,This itme contain two knownledge point:command netcat and pickle,the program monitor port 10007,and use pickle.loads deserialization,but you should use "cat ls | nc 172.17.0.2 10007" send this str to serever machine in you client machine,ls:"S'isme'\np0\n.",  
## Docker9:Access to the race condition(访问竞态)
* finish in 191010
* what question when finish it
	1. *use nc to establish monitor:nc -l -p 18211,the -l must in the front of -p*
	2. *ln -s is used to establish a soft link,the right is different from the original file,for example,chmod u+s the soft link file,you can't read the original file,but hard link can do it,if you want to do it use soft link,you should use readlink(c language) to get the original file*
	3. *access and open:after access and before open,you can change the file use 2*s
* introduction:  
*reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level10%E2%80%94%E2%80%94%E8%AE%BF%E9%97%AE%E7%AB%9E%E6%80%81%E6%9D%A1%E4%BB%B6%E6%BC%8F%E6%B4%9E.org>,answer this item,you need open three window.*  
## Docker10:use ncat -e（nc黑客指令）
* finish in 191011
* __introduction:__  
    This item is about nc cracker command,in the container,I run the command "nc -l -p portx -e /bin/bash",and when you get into the envirnoment,the system monitor the port automatically,and you need get the ip of the container,finally,you input "nc ip portxx" in you machine,you can get the "bash"  
## Docker11:php re
* finish in 191013
* __Introduction__:  
    reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level09%E2%80%94%E2%80%94PHP%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E7%9A%84%E5%AE%89%E5%85%A8%E9%97%AE%E9%A2%98.org>.analyze the "exec" and "getpasswd",the way to answer the item is: vim ls:[email "{${system(getflag)}}"] --> vim getflag:#! /bin/bash;mkdir /home/test/test --> PATH=/home/test:$PATH --> ./exec "php getpasswd ./ls" get the root passwd  
## Docker12:iptables+nc(iptables防火墙规则)
* finish in 191019
* __Introduction:__  
first,run ./getflag,and open another windows,input "nc localhost 1024 -p 65535",if the first window output "rand=2",you should reopen this window,and clear the port states by the flow of below picture.repeat it ,untill the first window output nothing,then you can input "isme" in the second window,you will get the flag  
![port states transform 图标](https://img-blog.csdn.net/20140705165548125?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvempzeWhqaA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)  



