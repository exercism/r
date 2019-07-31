# Affine Cipher 

Create an implementation of the affine cipher,
an ancient encryption system created in the Middle East.
 
The affine cipher is a type of monoalphabetic substitution cipher.
Each character is mapped to its numeric equivalent, encrypted with
a mathematical function and then converted to the letter relating to
its new numeric value. 

To make an affine cipher, you must create two functions:

1. `encrypt(message,a,b)`: A function to encrpt a message with keys `a` and `b`
2. `decrypt(encryption,a,b)`: A function to decrypt an encrypted messsage with keys `a` and `b`

## Algorithm 

The algorithm is as below:
 
** Note: `m` equals 26. You should take `m` as a constant. ** 
 
1. the encryption function is:
 
  `E(x) = (ax + b) mod m`
  -  where `x` is the letter's index from 0 - length of alphabet - 1
  -  `m` is the length of the alphabet. For the roman alphabet `m == 26`.
  -  and `a` and `b` make the key
  
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
  -  where `y` is the numeric value of an encrypted letter, ie. `y = E(x)`
  -  it is important to note that `a^-1` is the modular multiplicative inverse
     of `a mod m`
  -  the modular multiplicative inverse of `a` only exists if `a` and `m` are
     coprime.
     
  Alphabet | y
a | 0 |
b | 1 |
c | 2 | 
d | 3 |
e | 4 |
f | 5 |
etc.. | etc..
     
3. To find the MMI of `a`:

  `an mod m = 1`
  -  where `n` is the modular multiplicative inverse of `a mod m`
  
## Caveats

You must also check for the following:
- `a` is coprime with `m`, otherwise, an error is returned. The statement `a` and `m` are coprime means that the greatest common divisor of `a` and `m` equals 1.
- all encryptions have whitespace removed before applying the algorithm
- all encryptions have whitespace removed before applying the algorithm
- all messages are converted lower case before applying the algorithm

## Examples

 - Encoding `test` gives `ybty` with the key a=5 b=7
 - Decoding `ybty` gives `test` with the key a=5 b=7
 - Decoding `ybty` gives `lqul` with the wrong key a=11 b=7
 - Decoding `kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx`
   - gives `thequickbrownfoxjumpsoverthelazydog` with the key a=19 b=13
 - Encoding `test` with the key a=18 b=13
   - gives `Error: a and m must be coprime.`

### Examples of finding a Modular Multiplicative Inverse (MMI)

  - simple example:
    - `9 mod 26 = 9`
    - `9 * 3 mod 26 = 27 mod 26 = 1`
    - `3` is the MMI of `9 mod 26`
  - a more complicated example:
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
