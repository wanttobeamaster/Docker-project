#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>


int main(int argc,char **argv)
{
        printf("1");
        char *file=argv[1];
        char realpath[100];
        int ffd;
        char result[8];
        readlink(file,realpath,sizeof(realpath));
        printf("%s",realpath);
        ffd = open(realpath,O_RDONLY);
        read(ffd,result,8);
        printf("%s",result);
        close(ffd);
}

