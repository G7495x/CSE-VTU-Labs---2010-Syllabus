# 7. Write a program for error detecting code using 16-bit CRC.

### Intro

* Cyclic Redundancy Check or **CRC**, is an error detection algorithm (**NOT** an error correction algorithm!).
* Given binary data bits, CRC algotithm produces a **CRC bit-sequence** of specified length (For 16-bit CRC, it's 16 bits).
* **Higher** the length of the CRC, the **better** it is at identifying errors, but checking takes **longer**.
* CRC can only tolerate a certain number of **bit-parity errors**, beyond which errors go undetected.
* Polynomials are used to represent binary bits. This makes visualizing the operations easier.<br>
	Eg:	**1101** will be **1**x<sup>3</sup>+**1**x<sup>2</sup>+**0**x<sup>1</sup>+**1**x<sup>0</sup> = x<sup>3</sup>+x<sup>2</sup>+1
* CRC algorithm is **exactly** the same as division except that instead of subtraction, XOR operation is carried out.
* The **data** bits are the dividend.
* A **pre-defined divisor** is used.
* The divisor is **common** between transmitter and receiver.
* **REMINDER** is the CRC bits and **quotient** is discarded.

### Code Output

```bash
$ gcc 7.c -O2
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
