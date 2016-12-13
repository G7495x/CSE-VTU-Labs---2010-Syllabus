# (10CSL77) Networks Lab
### Exercises

#### PART A - Simulation Exercises
The following experiments shall be conducted using either NS2/OPNET or any other suitable simulator.
1. Simulate a three nodes point - to - point network with duplex links between them. Set the queue size and vary the bandwidth and find the number of packets dropped.
1. Simulate a four node point-to-point network with the links connected as follows: <br> n0 - n2 <br> n1 - n2 <br> n2 - n3. <br> Apply TCP agent between n0 - n3 and UDP between n1 - n3. Apply relevant applications over TCP and UDP agents changing the parameter and determine the number of packets sent by TCP / UDP.
1. Simulate the transmission of ping messages over a network topology consisting of 6 nodes and find the number of packets dropped due to congestion.
1. Simulate an Ethernet LAN using n nodes (6-10), change error rate and data rate and compare throughput.
1. Simulate an Ethernet LAN using n nodes and set multiple traffic nodes and plot congestion window for different source / destination.
1. Simulate simple ESS and with transmitting nodes in wire-less LAN by simulation and determine the performance with respect to transmission of packets.

#### PART-B
Implement the following in C/C++:
1. Write a program for error detecting code using CRC-CCITT (16- bits).
1. Write a program for distance vector algorithm to find suitable path for transmission.
1. Using TCP/IP sockets, write a client - server program to make the client send the file name and to make the server send back the contents of the requested file if present.
1. Implement the above program using message queues / FIFOs as IPC channels.
1. Write a program for simple RSA algorithm to encrypt and decrypt the data.
1. Write a program for congestion control using leaky bucket algorithm.

### Installation
1. Download NS2 and place in directory `/opt`
1. 