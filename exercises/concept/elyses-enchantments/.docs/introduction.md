# Introduction

A `vector` in R is a collection of values of the same `mode`: `numeric`, `character`, etc. If given mixed inputs, R will quietly coerce them all to a common type, usually character, which can lead to unexpected results.

## Creating vectors

If you already have all the values, use `c()` (short for "concatenate" or "combine"):

```R
x <- 10
v <- c(4, 7, x)
```

The `c()` function is very flexible, and inputs can include other vectors and ranges.
`c()` will take any number and variety of inputs, and flatten them into a single vector.

## Ranges

For a range of consecutive values (increasing or decreasing) you can use `:` notation

```R
v <- 1:5 # equivalent to c(1, 2, 3, 4, 5)
w <- 10:7 # c(10, 9, 8, 7)
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

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vector.
Wrong!

Negative indices are actually a way to ***remove*** en element, returning a shorter vector:

```R
> v <- c(2, 4, 6)
> v[-2]
[1] 2 6  # second element gone
```
