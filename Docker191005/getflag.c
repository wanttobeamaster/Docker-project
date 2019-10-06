#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <string.h>
#include <fcntl.h>

#define FAKEUID 1000

int main(int argc, char **argv, char **envp)
{
  int c;
  int fd;
  char token[18]="good_luck_for_you!";
  char passwd[8]="xiaoxiao";

  if(getuid() != FAKEUID) {
    printf("Security failure detected. UID %d started us, we expect %d\n", getuid(), FAKEUID);
    printf("The system administrators will be notified of this violation\n");
    exit(EXIT_FAILURE);
  }

  
  // snip, sorry :)
  int i=0;
  for(i=0;i<8;i++)
  {
    passwd[i]=token[17-2*i];
  }

  printf("flag's passwd is: \n");
  for(i=0;i<8;i++){
    printf("%c",passwd[i]);
  }

}



    

