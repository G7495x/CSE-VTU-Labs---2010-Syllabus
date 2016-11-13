# 10. Using FIFOs, write a client-server program to make the client send the file name and to make the server send back the contents of the file if present.

# Output

Server:
```
$ gcc 10.c
$ ./a.out
SERVER
Waiting for client...
Reading file Hello.txt
Writing back to client
```

Client:
```
$ ./a.out Hello.txt
CLIENT
Requesting Hello.txt
Waiting for server...
DATA:
Hello World!!!
```