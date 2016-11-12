# 8. Write a program for distance vector algorithm to find the suitable path for transmission.
### Code (C++)
```c++
#include <iostream>
#include <cstdio>
using namespace std;

class node{
public:
	int dist[20];
	int from[20];
}

int main(){
	int n,d[20][20];
	node route[10];

	cout<<"Enter n of nodes:";
	cin>>n;
	cout<<"Enter the distance matrix:\n";
	for(int i=0;i<n;i++){
		for(int j=0;j<n;j++){
			cin>>d[i][j];
			d[i][i]=0;					//Distance from i to i = 0
			route[i].dist[j]=d[i][j];
			route[i].from[j]=j;
		}
	}

	//Floyd's all pair shortest path algorithm
	bool flag;
	do{
		flag=0;
		for(int i=0;i<n;i++)
			for(int j=0;j<n;j++)
				for(int k=0;k<n;k++)
					if((route[i].dist[j])>(route[i].dist[k]+route[k].dist[j])){
						route[i].dist[j]=route[i].dist[k]+route[k].dist[j];
						route[i].from[j]=k;
						flag=1;
					}
	}while(flag);

	for(int i=0;i<n;i++){
		cout<<"Router info for router: "<<i+1<<'\n';
		cout<<"Dest\tNext Hop\tDist"<<'\n';
		for(int j=0;j<n;j++)
			printf("%d\t%d\t\t%d\n",j+1,route[i].from[j]+1,route[i].dist[j]);
	}

	return 0;
}
```
