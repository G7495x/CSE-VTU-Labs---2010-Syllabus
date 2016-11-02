#include <iostream>
#include <cstdlib>
#include <bitset>
using namespace std;
typedef unsigned int uint;

//Input a binary number from user
inline void input(uint& a,uint size){
	string s;
	cin>>s;
	uint n=s.length();
	if(n>size){
		cerr<<"Invalid! Data cannot exceed "<<size<<" bits!!!\n";
		exit(1);
	}

	a=0;
	for(uint i=0;i<n;++i){
		a<<=1;
		switch(s[i]){
			case '0':	break;
			case '1':	a|=1;
						break;
			default:	cerr<<"Invalid! Data must be a binary sequence!!!\n";
						exit(1);
		}
	}
}

//Calculate and return CRC bits (16 bits)
inline uint calcCRC(uint data,uint divisor){
	uint CRC=data<<16;
	uint subtractor=divisor<<15;

	//Perform the division operation
	for(int i=15;i>=0;--i,subtractor>>=1)
		if((CRC^subtractor)<CRC)
			CRC^=subtractor;

	return CRC;
}

int main(){
	uint data;									//Data bits (16 bits)
	uint CRC;									//CRC bits (16 bits)
	uint data_CRC;								//Data bits appended with CRC bits (16+16 bits)
	const uint divisor=0b10001000000100001;		//Divisor (CCITT standard x^16 + x^12 + x^5 + x^0)

	cout<<"Divisor:\n";
	cout<<bitset<17>(divisor)<<"\n\n";

	//Sending Phase
	cout<<"Enter data bits:\n";
	input(data,16);
	cout<<bitset<16>(data)<<'\n';				//Output the data as 16 bits

	CRC=calcCRC(data,divisor);
	data_CRC=(data<<16)|CRC;					//Append the CRC to data
	cout<<"Data after calculating CRC:\n";
	cout<<bitset<32>(data_CRC)<<"\n\n";

	//Receiving Phase
	cout<<"Enter recieved sequence:\n";
	input(data_CRC,32);

	CRC=data_CRC&((1<<16)-1);					//Get last 16 bits of data_CRC
	data=data_CRC>>16;							//Get the data bits
	if(CRC==calcCRC(data,divisor))
		cout<<"CRC match!\n";
	else
		cout<<"CRC mismatch!\n";

	return 0;
}
