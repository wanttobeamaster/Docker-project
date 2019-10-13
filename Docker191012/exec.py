import os
import sys


try:
	command = sys.argv[1]
	os.system("sed -i 's/xiaoxiao/rootlinux/' getpasswd.php")
	os.system(command)
	os.system("sed -i 's/rootlinux/xiaoxiao/' getpasswd.php")
except:
	pass
