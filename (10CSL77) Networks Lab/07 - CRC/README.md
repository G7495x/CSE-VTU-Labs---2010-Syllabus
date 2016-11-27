# 7. Write a program for error detecting code using 16-bit CRC.

### Intro
* Cyclic Redundancy Check or **CRC**, is an error detection algorithm (**NOT** an error correction algorithm!) for checking bit-parity errors that may occur during network transmission.
* Given binary data bits, CRC algotithm produces a **CRC bit-sequence** of specified length (For 16-bit CRC, it's 16 bits) using which bit-parity errors can be detected.
* **Higher** the length of the CRC, the **better** it is at identifying errors, but **longer** it takes to check and detect.
* CRC can only tolerate a certain number of **bit-parity errors**, beyond which errors go undetected.
* Polynomials are used to represent binary bits. This makes visualizing the operations easier.<br>
	Eg:	**1101** will be **1**x<sup>3</sup>+**1**x<sup>2</sup>+**0**x<sup>1</sup>+**1**x<sup>0</sup> = x<sup>3</sup>+x<sup>2</sup>+1<br><br>
	Addition/subtraction are **XOR** operations. For example x<sup>5</sup>+x<sup>4</sup>+x and x<sup>6</sup>+x<sup>4</sup>+x gives x<sup>6</sup>+x<sup>5</sup>.<br>
	Multiplcation and division are the same, but with XOR operations instead.
* CRC algorithm is **exactly** the same as division except that instead of subtraction, **XOR** operation is carried out.
	<br><br><img src="../Images/7-1.png?raw=true" width="480px">
	<br><br><img src="../Images/7-2.png?raw=true" width="480px">
* The **data** bits are the dividend.
* **REMAINDER** is the CRC bits and **quotient** is discarded.
* The divisor is normally called the **generator polynomial** or simply the generator. The divisor is 1 bit longer than the required size of CRC. The MSB of the divisor must be 1.
* A **pre-defined divisor** is used. The divisor is **common** between sender and receiver.
* For 16-bit CRC, the divisor must be **16+1=17** bits long with leftmost bit = 1.
* CRC is computed by sender. It is **appended** to the data bits and sent. The reciever just performs a division operation on the entire received bits. After the division, the appended CRC bits should be **zeros**. If not, then an **error** is detected.
* **CRC-CCITT** (16-bit) standard divisor - 0b10001000000100001. (x<sup>16</sup>+x<sup>12</sup>+x<sup>5</sup>+1)

### Mechanism
Given a binary number and a divisor, we convert the binary number into a multiple of the divisor by appending appropriate bits. The restriction here is we are allowed to only append as many bits as the divisor minus 1 (Eg. if divisor is 5 bits, we must append 4 bits). This is so that only one configuration of the composite number is possible. Hence we shift the bits, get the remainder and append it. This composite number is error resistant because inverting of any of the bits will result in the composite number being no longer a multiple of the divisor hence this mechanism proves very effective against bit-parity errors. However, it may not detect errors after the number of bit-parity errors crosses a threshold, but still, extremely effective.

For example, if the bits that have been inverted are represented as a binary number, where 1's represent the inverted bits and the others are 0's, and the resulting number is divisible by the divisor, and the errors go un-noticed (This number can be assumed to have been XOR'd with the transmitted data to form the erroneous data). Hence choice of the divisor must account for most of the common error patterns.

### Code (C++)
```c++
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
	input(data,16);												//Input a number in binary (data)
	cout<<bitset<16>(data)<<'\n';								//Output the data number as 16 bits

	data_CRC=(data<<16)|calcCRC(data,divisor);					//Shift data by 16 bits and insert CRC
	cout<<"Data after calculating CRC:\n";
	cout<<bitset<32>(data_CRC)<<"\n\n";							//Output data + crc

	//Receiving Phase (Receiver has data_CRC and divisor)
	cout<<"Enter recieved sequence:\n";
	input(data_CRC,32);											//Input data + crc

	data=data_CRC>>16;											//Data is first 16 bits only
	if((data_CRC&0b1111111111111111)==calcCRC(data,divisor))	//If recieved CRC (last 16 bits) equals calculated CRC
		cout<<"CRC matches recieved data!\n";
	else
		cout<<"CRC and recieved data mismatch!\n";

	return 0;
}

```

### Code Output
```
$ g++ 7.cpp
$ ./a.out
Divisor:
10001000000100001

Enter data bits:
100
0000000000000100
Data after calculating CRC:
00000000000001000100000010000100

Enter recieved sequence:
00000000000001000100000010000100
CRC matches recieved data!

$ ./a.out
Divisor:
10001000000100001

Enter data bits:
100
0000000000000100
Data after calculating CRC:
00000000000001000100000010000100

Enter recieved sequence:
00000000000001000100000010000101
CRC and recieved data mismatch!
```
