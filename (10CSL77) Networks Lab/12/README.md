# 12. Write a program for congestion control using leaky bucket algorithm.

### Code (C++)
```c++
#include <iostream>
#include <cstdlib>		//rand()
using namespace std;

int main(){
	int buffersize,n;
	cout<<"Enter buffer size:\t";
	cin>>buffersize;
	cout<<"Enter no. of inputs:\t";
	cin>>n;

	int sent,recieved,dropped,bufferload=0;
	cout<<"Sent\t\tReceived\tDropped\t\tBuffer Load\n";
	while(n!=0){
		sent=0;
		if(bufferload>0){
			--bufferload;
			sent=1;
		}

		recieved=rand()%5;
		dropped=0;
		if(bufferload+recieved>buffersize){
			dropped=bufferload+recieved-buffersize;
			bufferload=buffersize;
		}
		else
			bufferload+=recieved;

		cout<<sent<<"\t\t";
		cout<<recieved<<"\t\t";
		cout<<dropped<<"\t\t";
		cout<<bufferload<<'/'<<buffersize<<'\n';

		n--;
	}

	return 0;
}
```

### Output:
```
$ g++ 12.cpp
$ ./a.out
Enter buffer size:      10
Enter no. of inputs:    10
Sent            Received        Dropped         Buffer Load
0               1               0               1/10
1               2               0               2/10
1               4               0               5/10
1               0               0               4/10
1               4               0               7/10
1               4               0               10/10
1               3               2               10/10
1               3               2               10/10
1               2               1               10/10
1               4               3               10/10
```
