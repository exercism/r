# About

A `vector` in R is a collection of values of the same `mode`: commonly integer, numeric, character, logical; rarely complex or raw. 
They are stored contiguously in memory, similar to a C array.

If given mixed inputs, R will quietly coerce them all to a common type, usually character, which can lead to unexpected results.

## Creating vectors

If you already have all the values, use `c()` (short for "concatenate"):

```R
x <- 10
v <- c(4, 7, x)
```

If the vector starts small and grows a lot during runtime -- for example, adding values in a loop -- it can be significantly faster to pre-allocate a long vector which can be filled with real data later:

```R
v <- vector(length = 100) 
```

This minimizes the need for copying of the vector: a slow operation for long vectors.

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

The `rep()` function makes it easy to create repeating patterns:

```R
> count <- 3
> rep(7, count)
[1] 7 7 7

> rep(1:3, count)
[1] 1 2 3 1 2 3 1 2 3

> rep(1:3, each = 2) # the "each" keyword is required in this case
[1] 1 1 2 2 3 3
```

A few ranges are pre-defined as built-in constants:

```R
> letters
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

## Arithmetic

Operations are automatically applied element-wise along the vector. 
The loops, list comprehensions and recursions common in other languages are not needed and (for performance reasons) should be avoided if possible.

```R
2 + 1:3 # c(3, 4, 5)
2 * 1:3 # c(2, 4, 6)
12 / 1:3 # c(12  6  4)
2 ^ (1:3) # c(2, 4, 8) : exponentiation, operator precedence order here needs ()
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

This is more powerful than it first appears, and there will be more to explore in later concepts.

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

In fact, this returns a modified copy of the vector.

## Negative indices

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vector.
Wrong!
Use `tail(v)` for that.

Negative indices are actually a way to ***remove*** en element:

```R
> v <- c(2, 4, 6)
> v[-2]
[1] 2 6  # second element gone
```

This returns a shorter copy of the vector. `v` itself is unchanged.

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

## Vectors are *everywhere* in R

This will be a subject to return to in later topics. 
For now, just note the format of output in the REPL:

```R
> 1:20
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
[18] 18 19 20
```

The lines start with numbers in `[ ]` to indicate the index of the first element (useful for long vectors wrapping across multiple lines).
But why are single values preceded by `[1]`?

**There are no truly scalar values in R! What appears to be a single number or letter is actually a vector of length 1.**

## A word on notation

The vectors described above are more formally known as `atomic vectors`. This is because they can only contain simple, indivisible (hence "atomic") values such as `numeric`, `characacter`, `boolean`. More complex structures can form `recursive vectors`, which will be introduced when `lists` are discussed.

