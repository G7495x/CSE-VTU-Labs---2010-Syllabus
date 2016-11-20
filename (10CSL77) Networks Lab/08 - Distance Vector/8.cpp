#include <iostream>
using namespace std;

int main(){
	int n;

	cout<<"Enter no. of nodes:";
	cin>>n;

	int d[n][n];				//Distance matrix, d[i][j] represents distance between nodes i and j
	int nexthop[n][n];			//Next-hop matrix, nexthop[i][j] holds next hop node between nodes i and j
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
	for(k=0;k<n;++k)
		for(i=0;i<n;++i)
			for(j=0;j<n;++j)
				if(d[i][j]>d[i][k]+d[k][j]){	//If passing through node k is shorter
					d[i][j]=d[i][k]+d[k][j];	//Update distance matrix
					nexthop[i][j]=k;			//To go from i to j, go to node k first
				}

	for(i=0;i<n;++i){
		cout<<"Routing table of router "<<i+1<<":\n";
		cout<<"Destination\tNext Hop\tDistance"<<'\n';
		for(j=0;j<n;++j)
			if(j!=i){
				cout<<j+1<<"\t\t";
				cout<<nexthop[i][j]+1<<"\t\t";
				cout<<d[i][j]<<'\n';
			}
	}

	return 0;
}
