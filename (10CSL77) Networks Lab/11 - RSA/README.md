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

Algorithm:

1.	Choose two roughly 256-bit prime numbers, **a** and **b**, and derive **n = ab**. Plain Text **m** is represented by a number must be less than **n**.

2.	Select encryption key **x** such that **x** and **(a - 1)(b - 1)** are relatively prime.

3.	Calculate decryption key **y** such that **xy mod (a - 1)(b - 1)** = 1. At this point, **a** and **b** can be discarded.

	The public key = **{x,n}**.<br>
	The private key = **{y,n}**.

	**a** and **b** must be large and about the same size and both greater than 1,024 bits.
