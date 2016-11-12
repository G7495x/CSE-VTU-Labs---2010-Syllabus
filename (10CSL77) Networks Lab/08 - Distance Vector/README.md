# 8. Write a program for distance vector algorithm to find the suitable path for transmission.
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
		for(i=0;i<n;++i)
			for(j=0;j<n;++j)
				for(k=0;k<n;++k)
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
```bash
$ g++ 8.cpp
$ ./a.out
Enter no. of nodes:3
Enter the distance matrix:
0       1       4
1       0       2
4       2       0
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
1               2               3
2               2               2
3               3               0
```
