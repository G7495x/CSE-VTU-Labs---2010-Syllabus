#include <iostream>
using namespace std;

int main(){
	int incoming,outgoing,bucketsize,n,store=0;
	cout<<"Enter bucket size:\t";
	cin>>bucketsize;
	cout<<"Enter outgoing rate:\t";
	cin>>outgoing;
	cout<<"Enter no. of inputs:\t";
	cin>>n;

	while(n!=0){
		cout<<"\nEnter no. of incoming packets:\t";
		cin>>incoming;
		if(incoming<=(bucketsize-store))
			store+=incoming;
		else{
			cout<<"Dropped "<<incoming-(bucketsize-store)<<" packets\n";
			store=bucketsize;
		}
		cout<<"Bucket occupancy:\t\t"<<store<<"/"<<bucketsize<<'\n';
		store=store-outgoing;
		cout<<"After outgoing:\t\t\t"<<store<<"/"<<bucketsize<<'\n';

		n--;
	}

	return 0;
}