# 11. Write a program for simple RSA algorithm to encrypt and decrypt data.

### Intro
* Encryption is convertion of data/information into ciphertext so as to prevent information leakage to a 3rd party.
* Encryption uses a piece of data called **key** which is used to transform/encrypt the data.
* Sender encrypts data and sends it. Receiver receives data and de-encrypts it.
* The security of any encryption scheme depends on the length of the key.
* RSA algorithm is a **public key encryption** algorithm (Sender and receiver use different keys).
* Public key encryption is also known as asymmetric, or two-key encryption.
* The RSA algorithm has three phases for this: **Key-generation, Encryption, Decryption.**
* **Key-generation:** The key length is typically 512 bits, which requires an enormous computational power.

Key-generation algorithm:

1.	Choose two prime numbers, **a** and **b**, and derive **n = ab**. Plain Text **m** is represented by a number and **must** be less than **n**.

2.	Select encryption key **x** such that **x** and **(a - 1)(b - 1)** are relatively prime.

3.	Calculate decryption key **y** such that **xy mod (a - 1)(b - 1)** = 1. At this point, **a** and **b** can be discarded.

	The public key = **{x,n}**.<br>
	The private key = **{y,n}**.

	**a** and **b** must be large and about the same size.

* **Encryption:** Both sender and receiver must know the value of n. The sender knows the value of x, and only the receiver knows the value of y.

	Cipher text, **c** = **m<sup>x</sup>** mod **n**.
* **Decryption:**

	**m** = **c<sup>y</sup>** mod **n**.
* Further more, lookup **Diffie Hellman Key-Exchange protocol** for secure exchange of keys.

### Code
```c++
#include <iostream>
using namespace std;

//Returns GCD of 2 numbers
inline int gcd(int a,int b){
	int temp;
	while(b!=0){
		temp=b;
		b=a%b;
		a=temp;
	}
	return a;
}

int main(){
	int a=17,b=19;					//Small primes are used instead of actual big primes in this program
	int n=a*b;						//MUST be greater than 255 (Plain text is chars which can have a max value of 255)
	int z=(a-1)*(b-1);				//z represents (a-1)(b-1)

	cout<<"a:\t\t"<<a<<'\n';
	cout<<"b:\t\t"<<b<<'\n';
	cout<<"n=a*b:\t\t"<<n<<'\n';
	cout<<"(a-1)*(b-1):\t"<<z<<'\n';

	int x,y;						//The keys
	for(x=z-2;gcd(x,z)!=1;--x);		//Find x such that x and (a-1)(b-1) are relatively prime
	cout<<"x:\t\t"<<x<<'\n';
	for(y=2;x*y%z!=1;++y);			//Find y such that xy mod (a-1)(b-1) = 1
	cout<<"y:\t\t"<<y<<'\n';

	string msg;
	cout<<"Enter message to be encrypted:\n";
	cin>>msg;

	int i,j,len=msg.length();
	int m[len];						//Plain text
	int c[len];						//Cipher text

	//Encryption phase (c=m^x mod n)
	for(i=0;i<len;++i){
		m[i]=msg[i];

		c[i]=m[i]%n;
		for(j=1;j<x;++j)
			c[i]=c[i]*m[i]%n;
	}
	cout<<"Encrypted message:\n";
	for(i=0;i<len;++i)
		cout<<c[i]<<' ';
	cout<<'\n';

	//Decryption phase (m=c^y mod n)
	for(i=0;i<len;++i){
		m[i]=c[i]%n;
		for(j=1;j<y;++j)
			m[i]=m[i]*c[i]%n;

		msg[i]=m[i];
	}
	cout<<"Decrypted message:\n";
	cout<<msg<<'\n';

	return 0;
}
```

### Output
```
$ g++ 11.cpp
$ ./a.out
a:              17
b:              19
n=a*b:          323
(a-1)*(b-1):    288
x:              283
y:              115
Enter message to be encrypted:
Hello
Encrypted message:
200 118 243 243 100
Decrypted message:
Hello
```
