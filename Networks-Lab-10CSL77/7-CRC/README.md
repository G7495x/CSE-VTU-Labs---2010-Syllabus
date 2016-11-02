# 7. Write a program for error detecting code using 16-bit CRC.

### Intro

* CRC (short for Cyclic Redundancy Check) is an error detection algorithm (**NOT** an error correction algorithm!).
* Given binary data bits, CRC algotithm produces a CRC bit-sequence of specified length (For 16 bit CRC, it's 16 bits).
* Higher the length of the CRC, the better it is at identifying errors, but checking takes longer.
* CRC can only tolerate a certain number of bit parity errors, beyond which errors go undetected.


* CRC algorithm is the same as division except that instead of subtraction, XOR operation is carried out.
* The data bits are the dividend.
* A pre-defined divisor is used.
* The reminder is the CRC bits and quotient is discarded.
* The divisor is common between transmitter and receiver.

### Code Output

```bash
$ gcc 7.c -O2
$ ./a.out
Polynomial:
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
Polynomial:
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
