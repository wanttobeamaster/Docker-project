import os
import sys

try:
	BOOL = os.path.exists("/home/test/flag.txt")
	if BOOL == True:
		print("What rights do you have with document 'flag.txt'?")
	else:
		f = open("/root/flag.txt",'r')
		a = f.read()
		print(a)
		print('you are brave')
except:
	print("you have make some mistake")
