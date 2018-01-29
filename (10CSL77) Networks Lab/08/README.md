# 8. Write a program for distance vector algorithm to find the suitable path for transmission.

### Intro
* Distance vector routing protocol is a routing algorithm used in packet-switched networks.
* It is based on **Bellman-Ford's shortest path algorithm**.
* In a network, shortest path is calculated using this algorithm.
* Each node/router holds a table called routing table, which has 3 fields: **Destination, Next Hop, Distance.**
* Each router calculates the shortest path to all destinations requested by incoming packets through this algorithm and maintains this table.
<br><br>
* To simulate the network tables of a small network, we are instead using **Floyd's all pair shortest path algorithm** to achieve the same result.
* The network topology is assumed to be a **directed-weighted graph**. It is represented by a **directed-weighted cost matrix**. <br> The matrix holds the distances between any 2 nodes in a particular direction. For example **d[i][j]** represents distance from **i** to **j**. (It is directional, d[i][j]≠d[j][i])

### Algorithm
Floyd's algorithm is used to obtain all pairs' shortest paths. Between any two nodes, an intermediate node is considered and if the indirect path through the intermediate node is shorter than the direct path, the distance between the two nodes is updated to the indirect path's distance. This is done for all pairs of nodes considering all other nodes as intermediate nodes.
```
let dist be a |V| × |V| array of minimum distances initialized to ∞ (infinity)
for each vertex v
	dist[v][v] ← 0
for each edge (u,v)
	dist[u][v] ← w(u,v)  //The weight of the edge between (u,v)
for k from 1 to |V|
	for i from 1 to |V|
		for j from 1 to |V|
			if dist[i][j] > dist[i][k] + dist[k][j]
				dist[i][j] ← dist[i][k] + dist[k][j]
			end if
```

### Code Output
Topology: <br>
<img src="../Images/8-1.png?raw=true" width="480px">
```
$ g++ 8.cpp
$ ./a.out
Enter no. of nodes:3
Enter the distance matrix:
0       1       4
1       0       2
4       999     0
Routing table of router 1:
Destination     Next Hop        Distance
2               2               1
3               2               3
Routing table of router 2:
Destination     Next Hop        Distance
1               1               1
3               3               2
Routing table of router 3:
Destination     Next Hop        Distance
1               1               4
2               1               5
```
