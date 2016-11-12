#include <iostream>
#include <cstdio>
using namespace std;

int main(){
	int n;

	cout<<"Enter no. of nodes:";
	cin>>n;

	int d[n][n];			//Distance matrix
	int prev[n][n];			//Previous node
	int i,j,k;

	cout<<"Enter the distance matrix:\n";
	for(i=0;i<n;++i){
		for(j=0;j<n;++j){
			cin>>d[i][j];
			prev[i][j]=j;
		}
		d[i][i]=0;			//Distance from i to i = 0
	}

	//Floyd's all pair shortest path algorithm
	bool flag;
	do{
		flag=0;
		for(i=0;i<n;++i)
			for(j=0;j<n;++j)
				for(k=0;k<n;++k)
					if(d[i][j]>d[i][k]+d[k][j]){
						d[i][j]=d[i][k]+d[k][j];
						prev[i][j]=k;
						flag=1;
					}
	}while(flag);

	for(i=0;i<n;++i){
		cout<<"Router info for router "<<i+1<<":\n";
		cout<<"Destination\tNext Hop\tDistance"<<'\n';
		for(j=0;j<n;++j)
			printf("%d\t\t%d\t\t%d\n",j+1,prev[i][j]+1,d[i][j]);
	}

	return 0;
}