import os
import pickle
import time
import socket
import signal

signal.signal(signal.SIGCHLD, signal.SIG_IGN)

def server(skt):
    line = skt.recv(1024)
    obj = pickle.loads(line)
    try:
        if obj == "isme":
            skt.send(("isme right\n").encode())
            f = open("/root/flag.txt","r")
            flag = f.read()
            skt.send(str(flag).encode())
    except:
        skt.send(("you send me a wrong str").encode())


skt = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
skt.bind(('0.0.0.0', 10007))
skt.listen(10)

while True:
    clnt, addr = skt.accept()

    if(os.fork() == 0):
        clnt.send(("Accepted connection from %s:%d\n" % (addr[0], addr[1])).encode())
        server(clnt)
        os._exit(0)
