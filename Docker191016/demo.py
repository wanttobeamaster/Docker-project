# _*_ coding: UTF-8 _*_
import os
import sys
import time
import socket
import signal
import random

signal.signal(signal.SIGCHLD, signal.SIG_IGN)

def Time():
    return time.strftime('[%Y-%m-%d %H:%M:%S]',time.localtime(time.time()))

def server(skt):
    line = skt.recv(1024)
    print(line.decode())
    try:
        if line.decode() == "isme\n":
            skt.send(("isme right\n").encode())
            f = open("/root/flag.txt","r")
            flag = f.read()
            skt.send(str(flag).encode())
    except:
        skt.send(("you send me a wrong str").encode())


skt = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
skt.bind(('0.0.0.0', 1024))
skt.listen(10)

while True:
    clnt, addr = skt.accept()
    
    if(os.fork() == 0):
        clnt.send(("Accepted connection from %s:%d\n" % (addr[0], addr[1])).encode())
        if random.randint(1,2)==1:
            server(clnt)
            os._exit(0)
        else:
            print("rand=2")
            sys.exit(0)
