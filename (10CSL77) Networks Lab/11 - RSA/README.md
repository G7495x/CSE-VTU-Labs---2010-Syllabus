# 11. Write a program for simple RSA algorithm to encrypt and decrypt data.

### Intro
* Encryption is convertion of data/information into ciphertext so as to prevent information leakage to a 3rd party.
* Encryption uses a piece of data called **key** which is used to transform/encrypt the data.
* Sender encrypts data and sends it. Receiver receives data and de-encrypts it.
* The security of any encryption scheme depends on the length of the key.
<br><br>
* RSA algorithm is a **public key encryption** algorithm (Sender and receiver use different keys).
* Public key encryption is also known as asymmetric, or two-key encryption.
* The RSA algorithm has three phases for this: **Key-generation, Encryption, Decryption.**
* **Key-generation:** The key length is typically 512 bits, which requires an enormous computational power.

	Algorithm:

	1.	Choose two prime numbers, **a** and **b**, and derive **n = ab**. Plain Text is represented by a number **m** and **must** be less than **n**. **a** and **b** must be large and about the same size.

	2.	Select encryption key **x** such that **x** and **(a - 1)(b - 1)** are relatively prime.

	3.	Calculate decryption key **y** such that **xy mod (a - 1)(b - 1)** = 1. At this point, **a** and **b** can be discarded.

		The public key = **{x,n}**.<br>
		The private key = **{y,n}**.

* **Encryption:** Both sender and receiver must know the value of **n**. The sender knows the value of **x**, and only the receiver knows the value of **y**.

	Cipher text, **c** = **m<sup>x</sup>** mod **n**.
* **Decryption:**

	**m** = **c<sup>y</sup>** mod **n**.
* Further more, look-up **Diffie Hellman Key-Exchange protocol** for secure exchange of keys.

### Mechanism
Two approximately equal, large prime numbers **a** and **b** are picked and **n = ab**. **a** and **b** must be prime because the receiver receives only **x** and **n**. So, if **a** and **b** are primes, they can be extracted from **n**.

**n** must be greater than **m** because during decryption, to get back the original message, mod **n** operation is performed. If **n** was less than or equal to **m**, the remainder can never be **m** and original message can never be retreived.

### Code (C++)
#include <iostream>
#include <cstdio>		//gets()
#include <cstring>		//strlen()
using namespace std;

//Returns GCD of 2 integers
inline int GCD(int a,int b){
	int temp;
	while(b){
		temp=a;
		a=b;
		b=temp%b;
	}
	return a;
}

int main(){
	int a=13,b=17;					//Small primes are used instead of actual big primes in this program
	int n=a*b;						//MUST be greater than 127 (Plain text is ASCII chars which can have a max value of 127)
	int z=(a-1)*(b-1);				//z represents (a-1)(b-1)

	cout<<"a:\t\t"<<a<<'\n';
	cout<<"b:\t\t"<<b<<'\n';
	cout<<"n=a*b:\t\t"<<n<<'\n';
	cout<<"(a-1)*(b-1):\t"<<z<<'\n';

	int i,j;
	int x;							//Public key
	for(x=z-2;GCD(x,z)!=1;--x);		//Find x such that x and (a-1)(b-1) are relatively prime
	cout<<"x:\t\t"<<x<<'\n';

	int y;							//Private key
	for(y=2;x*y%z!=1;++y);			//Find y such that xy mod (a-1)(b-1) = 1
	cout<<"y:\t\t"<<y<<'\n';

	char msg[1024];
	cout<<"Enter message to be encrypted:\n";
	gets(msg);

	int len=strlen(msg);
	int m[len];						//Plain text
	int c[len];						//Cipher text

	for(i=0;i<len;++i)
		m[i]=msg[i];				//Convert char to int

	//Encryption phase (c = m^x mod n)
	for(i=0;i<len;++i){
		c[i]=m[i]%n;
		for(j=1;j<x;++j)
			c[i]=c[i]*m[i]%n;
	}
	cout<<"Encrypted message:\n";
	for(i=0;i<len;++i)
		cout<<(char)c[i];
	cout<<'\n';

	//Decryption phase (m = c^y mod n)
	for(i=0;i<len;++i){
		m[i]=c[i]%n;
		for(j=1;j<y;++j)
			m[i]=m[i]*c[i]%n;
	}
	cout<<"Decrypted message:\n";
	for(i=0;i<len;++i)
		cout<<(char)m[i];
	cout<<'\n';

	return 0;
}

```

### Output
```
$ g++ 11.cpp
$ ./a.out
a:              13
b:              17
n=a*b:          221
(a-1)*(b-1):    192
x:              187
y:              115
Enter message to be encrypted:
Hello!
Encrypted message:
òe88 T
Decrypted message:
Hello!
```
