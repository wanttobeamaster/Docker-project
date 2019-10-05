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
## Docker4:resolved domain to ip
*finish in 190929*
*introduction:*
*	The 4th item is about of domain resolve,you should add "123.206.87.240 flag.baidu.com" to /etc/hosts,and then ,run /home/test/dist/getflag,you can get the flag  
## Docker5:crontab and PATH
*finish in 191003*
*introduction:*
*	THis item is a litle diffcult,when you get into the container,you can see "run","profile","cron_script","writable",and then,the system will generate "flag".so,there 5 file in the file /home/test.you should analyze the relation about them.the relation about them is:"cron_script"-->"profile" and "writbale" -->"run"-->"flag",as you can see,there is a code "source /home/test/profile" in the "cron_script",this is the environment PATH os crontab.and the code "getflag" is in "run",so,we can think about where the getflag is,there is another diffcult point is that the linux PATH is not equal to crontabs PATH.so,coppy the content and delete the "profile",create a new "profile" and paste the content,the most important step is you should delete "/tmp" in the contents.wait a moments,and you can see the flag.  
## Docker6:thefting the file by ssh
*finish in 191005*
*introduction:*
*	This item is recurrence the <https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level05%E2%80%94%E2%80%94%E7%AA%83%E5%8F%96%E6%9C%BA%E5%AF%86%E6%96%87%E4%BB%B6.org>,beside the dockerfile and flagset,after get into the container,it has two user,and flag.txt is in /home/flag/flag.txt,first,I generate the rsa of test,copy id_rsa.pub and save it in authorized_keys,the ssh into flag,create .ssh file,and save authorized_keys,id_rsa,id_rsa.pub(test) in .ssh,Then,backup .ssh.so,if you want to get the flag,you should tar the .backup/.xxxxx,and copy id_rsa and id_rsa.pub to /home/test/.ssh.finally,ssh flag@localhost,it will get into flag automatically.   
