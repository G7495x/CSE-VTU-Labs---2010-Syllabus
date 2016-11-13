#include <iostream>
#include <cstdlib>
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