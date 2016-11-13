#include <iostream>
#include <cstdlib>		//exit()
#include <bitset>		//bitset<>()
using namespace std;
typedef unsigned int uint;

//Input a binary number of specified size from user
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

	//Perform the division operation
	divisor<<=15;
	for(int i=15;i>=0;--i,divisor>>=1)
		if((CRC^divisor)<CRC)
			CRC^=divisor;

	return CRC;
}

int main(){
	uint data;													//Data bits (16 bits)
	uint data_CRC;												//Data bits appended with CRC bits (16 + 16 bits)
	const uint divisor=0b10001000000100001;						//Divisor (CCITT standard: x^16 + x^12 + x^5 + x^0)

	cout<<"Divisor:\n";
	cout<<bitset<17>(divisor)<<"\n\n";

	//Sending Phase (Sender has data and divisor)
	cout<<"Enter data bits:\n";
	input(data,16);
	cout<<bitset<16>(data)<<'\n';								//Output the data as 16 bits

	data_CRC=(data<<16)|calcCRC(data,divisor);					//Shift data by 16 bits and insert CRC
	cout<<"Data after calculating CRC:\n";
	cout<<bitset<32>(data_CRC)<<"\n\n";

	//Receiving Phase (Receiver has data_CRC and divisor)
	cout<<"Enter recieved sequence:\n";
	input(data_CRC,32);

	data=data_CRC>>16;
	if((data_CRC&0b1111111111111111)==calcCRC(data,divisor))	//If recieved CRC (last 16 bits) equals calculated CRC
		cout<<"CRC matches recieved data!\n";
	else
		cout<<"CRC and recieved data mismatch!\n";

	return 0;
}
