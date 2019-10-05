## docker6:theft the important file
*	start in 191003
*	finish in 191005
*	This item is recurrence the <https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level05%E2%80%94%E2%80%94%E7%AA%83%E5%8F%96%E6%9C%BA%E5%AF%86%E6%96%87%E4%BB%B6.org>,beside the dockerfile and flagset,after get into the container,it has two user,and flag.txt is in /home/flag/flag.txt,first,I generate the rsa of test,copy id_rsa.pub and save it in authorized_keys,the ssh into flag,create .ssh file,and save authorized_keys,id_rsa,id_rsa.pub(test) in .ssh,Then,backup .ssh.so,if you want to get the flag,you should tar the .backup/.xxxxx,and copy id_rsa and id_rsa.pub to /home/test/.ssh.finally,ssh flag@localhost,it will get into flag automatically. 
