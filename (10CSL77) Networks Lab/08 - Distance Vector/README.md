# 8. Write a program for distance vector algorithm to find the suitable path for transmission.

### Intro
* Distance vector routing protocol is a routing algorithm used in packet-switched networks.
* It is based on Belman-Ford's algorithm.
* In a network, shortest path is calculated using this algorithm.
* Each node/router holds a table called routing table, which has 3 fields: **Destination, Next Hop, Distance.**
* Each router calculates the shortest path to all destinations requested by incoming packets through this algorithm and maintains this table.
<br><br>
* To simulate the network tables of a small network, we are instead using **Floyd's all pair shortest path algorithm** to achieve the same result.
* The network topology is assumed to be a **directed-weighted graph**. It is represented by a **directed-weighted cost matrix**.
* The matrix holds the distances between any 2 nodes in a particular direction. For example **d[i][j]** represents distance from **i** to **j**. (It is directional, d[i][j]≠d[j][i])

### Algorithm
Floyd's algorithm is used to obtain all pairs' shortest paths. Between any two nodes, an intermediate node is considered and if the indirect path through the intermediate node is shorter than the direct path, the distance between the two nodes is updated to the indirect path's distance. This is done for all pairs of nodes considering all other nodes as intermediate nodes.
<pre>
let dist be a |V| × |V| array of minimum distances initialized to ∞ (infinity)
for each vertex v
	dist[v][v] ← 0
for each edge (u,v)
	dist[u][v] ← w(u,v)  // the weight of the edge (u,v)
for k from 1 to |V|
	for i from 1 to |V|
		for j from 1 to |V|
			if dist[i][j] > dist[i][k] + dist[k][j]
				dist[i][j] ← dist[i][k] + dist[k][j]
			end if
</pre>
### Code (C++)
```c++
#include <iostream>
#include <cstdio>
using namespace std;

int main(){
	int n;

	cout<<"Enter no. of nodes:";
	cin>>n;

	int d[n][n];				//Distance matrix, d[i][j] represents distance between nodes i and j
	int nexthop[n][n];			//Next-hop matrix, nexthop[i][j] holds next hop between nodes i and j
	int i,j,k;

	cout<<"Enter the distance matrix:\n";
	for(i=0;i<n;++i){
		for(j=0;j<n;++j){
			cin>>d[i][j];
			nexthop[i][j]=j;	//At first, assume direct hop from i to j
		}
		d[i][i]=0;				//Distance from i to i = 0
	}

	//Floyd's all pair shortest path algorithm
	bool flag;
	do{
		flag=0;
		for(k=0;k<n;++k)
			for(i=0;i<n;++i)
				for(j=0;j<n;++j)
					if(d[i][j]>d[i][k]+d[k][j]){	//If passing through node k is shorter
						d[i][j]=d[i][k]+d[k][j];
						nexthop[i][j]=k;			//To go from i to j, go to node k first
						flag=1;
					}
	}while(flag);

	for(i=0;i<n;++i){
		cout<<"Router info for router "<<i+1<<":\n";
		cout<<"Destination\tNext Hop\tDistance"<<'\n';
		for(j=0;j<n;++j)
			printf("%d\t\t%d\t\t%d\n",j+1,nexthop[i][j]+1,d[i][j]);
	}

	return 0;
}
```

### Code Output
```
$ g++ 8.cpp
$ ./a.out
Enter no. of nodes:3
Enter the distance matrix:
0       1       4
1       0       2
4       999     0
Router info for router 1:
Destination     Next Hop        Distance
1               1               0
2               2               1
3               2               3
Router info for router 2:
Destination     Next Hop        Distance
1               1               1
2               2               0
3               3               2
Router info for router 3:
Destination     Next Hop        Distance
1               1               4
2               1               5
3               3               0
```
<img src="../Images/8-1.png?raw=true" width="480px">