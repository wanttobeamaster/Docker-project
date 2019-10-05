#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

void main(){
    int fd,td;
    int i = 0;
    char *path = "/root/flag.txt";
    char *ran = "/tmp/shift.txt";
    char result[8];
    int a[1];
    td=open(ran,O_RDONLY);
    fd=open(path,O_RDONLY);
    read(td,a,1);
    read(fd,result,8);
    a[0] -= 48;
    if(a[0] == 0) {
    a[0]++;
    }
    for(i = 0;i < 8;i++) {
	result[i] += a[0];
    }
    i = 0;
    for(i = 0;i < 8;i++) {
	printf("%c",result[i]);
    }
    close(fd);
    close(td);
}
