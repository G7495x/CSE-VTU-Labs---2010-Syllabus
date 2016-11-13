# 12. Write a program for congestion control using leaky bucket algorithm.
### Code (C++)
```c++
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
```
### Output:
```
$ g++ 12.cpp
$ ./a.out
Enter bucket size:      20
Enter outgoing rate:    5
Enter no. of inputs:    3

Enter no. of incoming packets:  12
Bucket occupancy:               12/20
After outgoing:                 7/20

Enter no. of incoming packets:  12
Bucket occupancy:               19/20
After outgoing:                 14/20

Enter no. of incoming packets:  12
Dropped 6 packets
Bucket occupancy:               20/20
After outgoing:                 15/20
```
