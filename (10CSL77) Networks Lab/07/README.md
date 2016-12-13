# 7. Write a program for error detecting code using 16-bit CRC.

### Intro
* Cyclic Redundancy Check or **CRC**, is an error detection algorithm (**NOT** an error correction algorithm!) for checking bit-parity errors that may occur during network transmission.
* Given binary data bits, CRC algorithm produces a **CRC bit-sequence** of specified length (For 16-bit CRC, it's 16 bits) using which bit-parity errors can be detected.
* **Higher** the length of the CRC, the **better** it is at identifying errors, but **longer** it takes to check and detect.
* CRC can only tolerate a certain number of bit-parity errors, beyond which errors go undetected.
* Polynomials are used to represent binary bits. This makes visualizing the operations easier.<br>
  Eg:	**1101** will be **1**x<sup>3</sup>+**1**x<sup>2</sup>+**0**x<sup>1</sup>+**1**x<sup>0</sup> = x<sup>3</sup>+x<sup>2</sup>+1<br><br>
  Addition/subtraction are **XOR** operations. For example x<sup>5</sup>+x<sup>4</sup>+x and x<sup>6</sup>+x<sup>4</sup>+x gives x<sup>6</sup>+x<sup>5</sup>.<br>
  Multiplication and division are the same, but with XOR operations instead.
* CRC algorithm is **exactly** the same as division except that instead of subtraction, **XOR** operation is carried out.
<br><br><img src="../Images/7-1.png?raw=true" width="480px">
<br><br><img src="../Images/7-2.png?raw=true" width="480px">
<br><br>
* The **dividend** is the data bits.
* The **remainder** is the CRC bits. <br> The **quotient** is useless and is discarded.
* The **divisor** is normally called the generator polynomial or simply the generator. <br> The divisor is 1 bit longer than the required size of CRC with MSB = 1. <br> A pre-defined divisor is used and is common between sender and receiver.
* For 16-bit CRC, the divisor must be 16+1=17 bits long with leftmost bit = 1.
* CRC is computed by sender and is **appended** to the data bits and sent. <br> The receiver just performs a division operation on the entire received bits. After the division, the appended CRC bits should be **zeros**. If not, then an error is detected.
* **CRC-CCITT** (16-bit) standard divisor - 0b10001000000100001. (x<sup>16</sup>+x<sup>12</sup>+x<sup>5</sup>+1)

### Mechanism
Given a binary number and a divisor, we append appropriate bits to the binary number so that it becomes divisible by the divisor (So the binary number is now a multiple of the divisor). The restriction here is we are allowed to only append as many bits as the divisor minus 1 (Eg. if divisor is 5 bits, we can append 4 bits only). This is so that only one configuration of the composite number is possible.

So, to obtain this result, we first left-shift the data bits by CRC length, get the remainder by XOR-division and XOR the remainder to the dividend (Left-shifted data bits). This composite number is now a multiple of the divisor. It is error resistant because inverting any of the bits will result in the composite number no longer being a multiple of the divisor. Hence this mechanism proves very effective against bit-parity errors. However, it may not detect errors after the number of bit-parity errors crosses a threshold, but still, extremely effective.

For example,
<br> Divisor: 1011
<br> Data: 1001 (Dataword)
<br> CRC = 110
<br> Transmitted data = 1001110 (Transmitted Codeword)
<br> Received data: 1100010 (Received Codeword)
<br><br> In this example, it can be assumed that the number 0101100 is XOR'd with the original data to get the erroneous data. This number is called the error vector. If the error vector is divisible by the divisor, CRC algorithm fails. Hence choice of divisor must be done carefully and must account for most of the common error patterns.

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
