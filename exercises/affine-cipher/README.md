# Affine Cipher 

Create an implementation of the affine cipher,
an ancient encryption system created in the Middle East.
 
The affine cipher is a type of monoalphabetic substitution cipher.
Each character is mapped to its numeric equivalent, encrypted with
a mathematical function and then converted to the letter relating to
its new numeric value. 

To make an affine cipher, you must create two main functions:

1. `encrypt(plaintext,a,b)`: A function to encrpt a plaintext/message with keys `a` and `b`
2. `decrypt(encryption,a,b)`: A function to decrypt an encrypted plaintext/message with keys `a` and `b`

In order to help to break down the problem into smaller pieces, you must create 4 utility functions. 

1. `normalise(text)`: A function to remove whitepsace in text and change all letter cases to lower case.
2. `lookupindex(normalisedtext)`: A function to return an index of a letter from a lookup table. 
3. `gcd(x,y)`: A function to compute the greatest common divisor of two numbers. 
4. `mmi(a,m)`: A function to compute the modulo multiplicative inverse `a mod m`.

Note: These utility functions are not required to pass the test. 

## Main Algorithm 

The algorithm is as below:
 
1. the encryption function is:
 
  `E(x) = (ax + b) mod m`
  *  where `x` is the letter's index from 0 to (length of alphabet - 1)
  *  `m` is the length of the alphabet. For the roman alphabet `m == 26`.
  *  and `a` and `b` make the key
  
  Alphabet | x
a | 0 |
b | 1 |
c | 2 | 
d | 3 |
e | 4 |
f | 5 |
etc.. | etc..
  
2. the decryption function is:
 
  `D(y) = a^-1(y - b) mod m`
  *  where `y` is the encrypted letter's index from 0 to (length of alphabet - 1)
  *  it is important to note that `a^-1` is the modular multiplicative inverse
     of `a mod m`
  *  the modular multiplicative inverse of `a` only exists if `a` and `m` are
     coprime.
     
  Alphabet | y
a | 0 |
b | 1 |
c | 2 | 
d | 3 |
e | 4 |
f | 5 |
etc.. | etc..

3. To find the GCD of two numbers: 

The easiest way to execute this is to compute this is to use the Euclidean Algorithm. The benefits of using the euclidean algorithm is that it is commutative, i.e. `gcd(x,y) = gcd(y,x)`.

4. To find the MMI of `a`:

`an mod m = 1`, where `n` is the modular multiplicative inverse of `a mod m`
  
## Caveats

You must also check for the following:
* `a` is coprime with `m`, otherwise, an error is returned. The statement `a` and `m` are coprime means that the greatest common divisor of `a` and `m` equals 1.
* all messages are normalised (white space is removed and all letters converted to lowercase) before applying the encrypt algorithm
* all encryptions are normalised (white space is removed and all letters converted to lowercase) before applying the decrypt algorithm

## Examples of Main Algorithm

 * Encoding `test` gives `ybty` with the key a=5 b=7
 * Decoding `ybty` gives `test` with the key a=5 b=7
 * Decoding `ybty` gives `lqul` with the wrong key a=11 b=7
 * Decoding `kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx`
   - gives `thequickbrownfoxjumpsoverthelazydog` with the key a=19 b=13
 * Encoding `test` with the key a=18 b=13
   - gives `Error: a and m must be coprime.`
   
### Examples of finding a Greatest Common Divisor (GCD)

 * The greatest common divisor of two prime numbers is 1
 * The greatest common divisor of 8 and 24 is 8
 * The greatest commond divisor of 60 and 9 is 3
   
### Examples of finding a Modular Multiplicative Inverse (MMI)

  1. simple example:
    - `9 mod 26 = 9`
    - `9 * 3 mod 26 = 27 mod 26 = 1`
    - `3` is the MMI of `9 mod 26`
  2. a more complicated example:
    - `15 mod 26 = 15`
    - `15 * 7 mod 26 = 105 mod 26 = 1`
    - `7` is the MMI of `15 mod 26`


## Installation
See [this guide](https://exercism.io/tracks/r/installation) for instructions on how to setup your local R environment.

## How to implement your solution
In each problem folder, there is a file named `<exercise_name>.R` containing a function that returns a `NULL` value. Place your implementation inside the body of the function.

## How to run tests

Inside of RStudio, simply execute the `test_<exercise_name>.R` script. This can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because Exercism code and tests are in the same folder, use this same path for both `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.


## Source

1. [Lecture Notes](http://pi.math.cornell.edu/~kozdron/Teaching/Cornell/135Summer06/Handouts/affine.pdf)
2. [Wikipedia](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse) 
3. [Modular Multiplicative Inverse](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
