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

					check(mkfifo("FIFO",0777),"mkfifo");
					check(fifo=open("FIFO",O_RDONLY|O_NONBLOCK),"open");
					printf("Waiting for client...\n");
					while((count=read(fifo,filename,sizeof(filename)))==0)	sleep(1);
					filename[count]='\0';
					close(fifo);
					unlink("FIFO");

					printf("Reading file %s\n",filename);
					check(file=open(filename,O_RDONLY),"open");
					count=read(file,data,sizeof(data));
					data[count]='\0';
					close(file);

					sleep(2);
					check(fifo=open("FIFO",O_WRONLY),"open");
					printf("Writing back to client\n");
					check(write(fifo,data,strlen(data)),"write");
					close(fifo);
					break;
		//Client
		case 2:		printf("CLIENT\n");

					check(fifo=open("FIFO",O_WRONLY),"open");
					printf("Requesting %s\n",argv[1]);
					check(write(fifo,argv[1],strlen(argv[1])),"write");
					close(fifo);

					sleep(1);
					check(mkfifo("FIFO",0777),"mkfifo");
					check(fifo=open("FIFO",O_RDONLY|O_NONBLOCK),"open");
					printf("Waiting for server...\n");
					while((count=read(fifo,data,sizeof(data)))==0)	sleep(1);
					data[count]='\0';
					printf("DATA:\n%s\n",data);
					close(fifo);
					unlink("FIFO");
					break;

		default:	perror("Invalid no. of arguments!\n");
					exit(1);
	}

	return 0;
}
