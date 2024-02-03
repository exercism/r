# Introduction

A `vector` in R is a collection of values of the same `mode`: `numeric`, `character`, etc. If given mixed inputs, R will quietly coerce them all to a common type, usually character, which can lead to unexpected results.

## Creating vectors

If you already have all the values, use `c()` (short for "concatenate" or "combine"):

```R
x <- 10
v <- c(4, 7, x)
```

## Ranges, sequences, repeats

For a range of consecutive values (increasing or decreasing) you can use `:` notation

```R
v <- 1:5 # equivalent to c(1, 2, 3, 4, 5)
w <- 10:7 # c(10, 9, 8, 7)
```

The `seq()` function offers finer control:

```R
# specify step size
seq(2, 11, by = 3) # c(2, 5, 8, 11)

# specify number of values, evenly-spaced
seq(2.5, 4, length.out = 5) # c(2.500, 2.875, 3.250, 3.625, 4.000) 
```

A few ranges are pre-defined as built-in constants:

```R
> letters
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

## Arithmetic

Operations are automatically applied element-wise along the vector. 
The loops, list comprehensions and recursions common in other languages are not needed and (for performance reasons) should usually be avoided.

```R
2 + 1:3 # c(3, 4, 5)
2 * 1:3 # c(2, 4, 6)
12 / 1:3 # c(12  6  4)
2 ^ (1:3) # c(2, 4, 8) : exponentiation, precedence order here needs ()
```

Pairs of vectors also work:

```R
> v <- 1:3
> w <- 5:7

> v + w
[1]  6  8 10

> v * w
[1]  5 12 21

> v ^ w
[1]    1   64 2187
```

## Accessing vector elements

As in many languages, we can use the index in brackets:

```R
> v <- 4:7
> v[2]
[1] 5
> v[2:4]
[1] 5 6 7
```

But beware: ***R uses 1-based indexing by default***. 

This is common for scientific languages (Fortran, Matlab, Julia) but differs from the zero-based indexing of C and its many successors.

Ranges can be used, as in the example above but also in the highly flexible `c()` function:

```R
v <- c(4, 7, 10)
w <- c(2, v[2:3], 11) # c(2, 7, 10, 11)
```

`vectors` (like most things in R) can be treated as mutable, using similar flexible syntax to write to single or multiple elements:

```R
> v <- 1:10
> v[2] <- 42
> v[4:6] <- c(11, 12, 13)
> v
 [1]  1 42  3 11 12 13  7  8  9 10
```

## Negative indices

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vectore.
Wrong!

Negative indices are actually a way to ***remove*** en element, returning a shorter vector:

```R
> v <- c(2, 4, 6)
> v[-2]
[1] 2 6  # second element gone
```

## Vector conditionals

Applying comparisons to a vector will return an equal-length vector of booleans. 
This can be very convenient within functions such as `all()` and `any()`:

```R
> v <- c(4, 7, 10)
> v >= 6
[1] FALSE  TRUE  TRUE
> all(v > 6)
[1] FALSE    # not all elements match this condition
> any(v > 6)
[1] TRUE     # at least one element matches
```
