# 10. Using FIFOs, write a client-server program to make the client send the file name and to make the server send back the contents of the file if present.
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