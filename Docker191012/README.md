## Docker11:php re
* finish in 191013
* Question during finish:
    1. I don't know the php is use the READ right,so,the first time i finish the code,and test it,Then,i find that only READ can run the php.I have to modify the code,so in the last,I use the linux "sed",I write a exec program,and before run php,the program modify the passwd,and mend it again in the last of the program.
* Introduction:
    reference<https://github.com/1u4nx/Exploit-Exercises-Nebula/blob/master/Level09%E2%80%94%E2%80%94PHP%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E7%9A%84%E5%AE%89%E5%85%A8%E9%97%AE%E9%A2%98.org>.analyze the "exec" and "getpasswd",the way to answer the item is: vim ls:[email "{${system(getflag)}}"] --> vim getflag:#! /bin/bash;mkdir /home/test/test --> PATH=/home/test:$PATH --> ./exec "php getpasswd ./ls" get the root passwd
