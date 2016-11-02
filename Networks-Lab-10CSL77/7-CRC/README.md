# 7. Write a program for error detecting code using 16-bit CRC.

### Intro

* Cyclic Redundancy Check or **CRC**, is an error detection algorithm (**NOT** an error correction algorithm!).
* Given binary data bits, CRC algotithm produces a **CRC bit-sequence** of specified length (For 16-bit CRC, it's 16 bits).
* **Higher** the length of the CRC, the **better** it is at identifying errors, but **longer** is the checking process.
* CRC can only tolerate a certain number of **bit-parity errors**, beyond which errors go undetected.
* Polynomials are used to represent binary bits. This makes visualizing the operations easier.<br>
	Eg:	**1101** will be **1**x<sup>3</sup>+**1**x<sup>2</sup>+**0**x<sup>1</sup>+**1**x<sup>0</sup> = x<sup>3</sup>+x<sup>2</sup>+1<br><br>
	Addition/subtraction are XOR operations. For example x<sup>5</sup>+x<sup>4</sup>+x and x<sup>6</sup>+x<sup>4</sup>+x gives x<sup>6</sup>+x<sup>5</sup>.<br>
	Multiplcation and division are the same, but with XOR operations instead.<br><br>
	<img src="https://github.com/G7495x/CSE-VTU-Labs-2010-Syllabus/blob/master/Networks-Lab-10CSL77/Images/7_1.png?raw=true" width="480px">
* CRC algorithm is **exactly** the same as division except that instead of subtraction, **XOR** operation is carried out.<br><br>
	<img src="https://github.com/G7495x/CSE-VTU-Labs-2010-Syllabus/blob/master/Networks-Lab-10CSL77/Images/7_2.png?raw=true" width="480px">
* The **data** bits are the dividend.
* A **pre-defined divisor** is used. The divisor is **common** between transmitter and receiver.
* **REMAINDER** is the CRC bits and **quotient** is discarded.
* For 16-bit CRC, the divisor must be 17 bits long with leftmost bit = 1.
* **CRC-CCITT** (16-bit) standard divisor - 0b10001000000100001.

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
