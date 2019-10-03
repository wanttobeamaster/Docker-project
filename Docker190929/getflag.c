#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

void main(){
    int fd;
    char *path="/root/flag.txt";
    char result[8];
    fd=open(path,O_RDONLY);
    read(fd,result,8);
    printf("%s",&result[0]);
    close(fd);
}
