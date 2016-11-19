# 10. Using FIFOs, write a client-server program to make the client send the file name and to make the server send back the contents of the file if present.

### Code (C)
```c
#include <stdio.h>
#include <stdlib.h>		//exit()
#include <string.h>		//strlen()
#include <unistd.h>		//read(),write(),close(),unlink(),sleep()
#include <sys/stat.h>	//mkfifo(),open()
#include <sys/types.h>	//mkfifo(),open()
#include <fcntl.h>		//open()
#include <limits.h>		//PIPE_BUF

inline void check(int ret,char* cmd){
	if(ret==-1){
		perror(cmd);
		exit(1);
	}
}

int main(int argc,char** argv){
	int fifo,file;
	char filename[256],data[PIPE_BUF];
	int count;

	switch(argc){
		//Server
		case 1:		printf("SERVER\n");

					check(mkfifo("FIFO",0777),"mkfifo");								//Make fifo
					printf("Waiting for client...\n");
					check(fifo=open("FIFO",O_RDONLY),"open");							//Bind as reader
					while((count=read(fifo,filename,sizeof(filename)))==0)	sleep(1);	//Check repeatedly until filename is written
					check(count,"read");												//If read() failed
					filename[count]='\0';												//Mannually null terminate the string
					close(fifo);														//Unbind
					unlink("FIFO");														//Delete fifo file

					printf("Reading file %s\n",filename);
					check(file=open(filename,O_RDONLY),"open");							//Open requested file
					check(count=read(file,data,sizeof(data)),"read");					//Read the contents
					data[count]='\0';													//Mannually null terminate the string
					close(file);														//Close the file

					sleep(2);
					check(fifo=open("FIFO",O_WRONLY),"open");							//Bind as writer
					printf("Writing back to client\n");
					check(write(fifo,data,strlen(data)),"write");						//Write to fifo
					close(fifo);														//Unbind
					break;
		//Client
		case 2:		printf("CLIENT\n");

					check(fifo=open("FIFO",O_WRONLY),"open");							//Bind as writer
					printf("Requesting %s\n",argv[1]);
					check(write(fifo,argv[1],strlen(argv[1])),"write");					//Write to fifo
					close(fifo);														//Unbind

					sleep(1);
					check(mkfifo("FIFO",0777),"mkfifo");								//Make fifo
					printf("Waiting for server...\n");
					check(fifo=open("FIFO",O_RDONLY),"open");							//Bind as reader
					while((count=read(fifo,data,sizeof(data)))==0)	sleep(1);			//Check repeatedly until data is written
					check(count,"read");												//If read() failed
					data[count]='\0';													//Mannually null terminate the string
					printf("DATA:\n%s\n",data);
					close(fifo);														//Unbind
					unlink("FIFO");														//Delete fifo file
					break;

		default:	perror("Invalid no. of arguments!\n");
					exit(1);
	}

	return 0;
}

```

### Output

```
<Terminal 1 - Server>			<Terminal 2 - Client>
$ gcc 10.c
$ ./a.out
SERVER
Waiting for client...
								$ ./a.out Hello.txt
								CLIENT
								Requesting Hello.txt
Reading file Hello.txt
								Waiting for server...
Writing back to client
								DATA:
								Hello World!!!
```