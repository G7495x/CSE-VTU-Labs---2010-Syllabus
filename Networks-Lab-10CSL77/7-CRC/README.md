<h1>7. Write a program for error detecting code using 16-bit CRC.</h1>
<h3>Intro</h3>
<ul>
<li>CRC (stands for Cyclic Redundancy Check) is an error detection algorithm (NOT an error correction algorithm!)</li>
<li>Given binary data bits, CRC algotithm produces a CRC bit-sequence of specified length (For 16 bit CRC, its 16 bits)</li>
<li>Higher the length of the CRC, the better it is at identifying errors, but checking takes longer</li>
</ul>
<h3>Code Output</h3>
<pre><code>$ gcc 7.c -O2
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
</code></pre>
