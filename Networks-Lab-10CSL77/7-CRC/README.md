# 7. Write a program for error detecting code using 16-bit CRC.

### Intro

* Cyclic Redundancy Check or **CRC**, is an error detection algorithm (**NOT** an error correction algorithm!).
* Given binary data bits, CRC algotithm produces a **CRC bit-sequence** of specified length (For 16-bit CRC, it's 16 bits).
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
* CRC is computed by sender. It is **appended** to the data bits and sent. The reciever just performs a division operation on the whole bits. If last 16 bits (for 16-bit CRC) are zeros, then no errors were detected.
* A **pre-defined divisor** is used. The divisor is **common** between sender and receiver.
* For 16-bit CRC, the divisor must be 17 bits long with leftmost bit = 1.
* **CRC-CCITT** (16-bit) standard divisor - 0b10001000000100001.
* The divisor is normally called the **generator polynomial** or simply the **generator**.

### Code

```c++
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
            case '0':   break;
            case '1':   a|=1;
                        break;
            default:    cerr<<"Invalid! Data must be a binary sequence!!!\n";
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
    uint data;                                  //Data bits (16 bits)
    uint CRC;                                   //CRC bits (16 bits)
    uint data_CRC;                              //Data bits appended with CRC bits (16+16 bits)
    const uint divisor=0b10001000000100001;     //Divisor (CCITT standard x^16 + x^12 + x^5 + x^0)

    cout<<"Divisor:\n";
    cout<<bitset<17>(divisor)<<"\n\n";

    //Sending Phase
    cout<<"Enter data bits:\n";
    input(data,16);
    cout<<bitset<16>(data)<<'\n';               //Output the data as 16 bits

    CRC=calcCRC(data,divisor);
    data_CRC=(data<<16)|CRC;                    //Append the CRC to data
    cout<<"Data after calculating CRC:\n";
    cout<<bitset<32>(data_CRC)<<"\n\n";

    //Receiving Phase
    cout<<"Enter recieved sequence:\n";
    input(data_CRC,32);

    CRC=data_CRC&((1<<16)-1);                   //Get last 16 bits of data_CRC
    data=data_CRC>>16;                          //Get the data bits
    if(CRC==calcCRC(data,divisor))
        cout<<"CRC match!\n";
    else
        cout<<"CRC mismatch!\n";

    return 0;
}
```

### Code Output

```bash
$ g++ 7.cpp -O2
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
CRC match!

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
CRC mismatch!
```
