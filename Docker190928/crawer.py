import requests
import re
try:
    f = open("/etc/hosts",'r')
    hosts = f.read()
    f.close()
    match = re.findall('123.206.87.240\ +flag.baidu.com',hosts)
    if match != []:
        f_flag = open("/root/flag.txt",'r')
        flag = f_flag.read()
        print(flag)
    else:
        print("you haven't resolved the domain name 'flag.baidu.com' to IP '123.206.87.240' yet")
except:
    print("something wrong")
