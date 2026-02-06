# About

A [`vector`][ref-vector] in R is a collection of values of the same [`type`][ref-type]: commonly [`integer`][ref-integer], [`numeric`][ref-numeric], [`character`][ref-character], [`logical`][ref-logical]; rarely [`complex`][ref-complex] or [`raw`][ref-raw].
They are stored contiguously in memory, similar to a C array.

If given mixed inputs, R will quietly coerce them all to a common type, usually `character`, which can lead to unexpected results.

```R
v <- c(2, 5.4, "txt")
v
#> [1] "2"   "5.4" "txt"
typeof(v)
#> [1] "character"
```

## Creating vectors

If you already have all the values, use [`c()`][ref-concatenate] (short for "concatenate"):

```R
x <- 10
v <- c(4, 7, x)
```

The `c()` function is very flexible, and inputs can include other vectors and ranges.

If the vector starts small and grows a lot during runtime (for example, adding values in a loop), it can be significantly faster to pre-allocate a long vector which can be filled with real data later:

```R
v <- vector(length = 100) 
```

This minimizes the need for copying of the object: a slow and memory-hungry operation for long vectors.

## Ranges, sequences, repeats

For a range of consecutive values (increasing or decreasing) you can use `:` notation

```R
v <- 1:5 # equivalent to c(1, 2, 3, 4, 5)
w <- 10:7 # c(10, 9, 8, 7)
```

In R, ranges are not a separate type: just a shorthand way to construct a vector.

The [`seq()`][ref-seq] function offers finer control:

```R
# specify step size
seq(2, 11, by = 3) # c(2, 5, 8, 11)

# specify number of values, evenly-spaced
seq(2.5, 4, length.out = 5) # c(2.500, 2.875, 3.250, 3.625, 4.000) 
```

The [`rep()`][ref-rep] function makes it easy to create repeating patterns:

```R
count <- 3
rep(7, count)
#> [1] 7 7 7

rep(1:3, count)
#> [1] 1 2 3 1 2 3 1 2 3

rep(1:3, each = 2) # the "each" keyword is required in this case
#> [1] 1 1 2 2 3 3
```

A few ranges are pre-defined as built-in constants:

```R
letters  # LETTERS is the UPPERCASE equivalent
#> [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"

month.name
#> [1] "January"   "February"  "March"     "April"     "May"       "June"      "July"      "August"   
#> [9] "September" "October"   "November"  "December" 

month.abb
#> [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"
```

## Arithmetic

Operations are automatically applied element-wise along the vector.
The loops, list comprehensions and recursions common in other languages are not needed and (for performance reasons) should be avoided if possible.

```R
2 + 1:3     # c(3, 4, 5)
2 * 1:3     # c(2, 4, 6)
12 / 1:3    # c(12  6  4)
2 ^ (1:3)   # c(2, 4, 8) : exponentiation, operator precedence order here needs ()
```

Pairs of vectors also work, with elements treated pair-wise:

```R
v <- 1:3
w <- 5:7

v + w
#> [1]  6  8 10

v * w
#> [1]  5 12 21

v ^ w
#> [1]    1   64 2187
```

This is more powerful than it first appears, and there will be more to explore in later concepts.

## Accessing vector elements

As in many languages, we can use the index in brackets:

```R
v <- 4:7
v[2]
#> [1] 5
v[2:4]
#> [1] 5 6 7
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
v <- 1:10
v[2] <- 42
v[4:6] <- c(11, 12, 13)
v
#> [1]  1 42  3 11 12 13  7  8  9 10
```

## Negative indices

Programmers familiar with other languages might guess that `v[-1]` is a way to access the last element in a vector.
*Wrong!*
Use [`tail()`][ref-tail] for that.

```R
v <- c(2, 4, 6) # defaults to last 6 entries
tail(v)
#> [1] 2 4 6
tail(v, n=1) # just the last entry
#> [1] 6
```

Negative indices are actually a way to ***remove*** an element:

```R
v <- c(2, 4, 6)
v[-2]
#> [1] 2 6  # second element gone
```

This returns a shorter copy of the vector. `v` itself is unchanged.

## Vector conditionals

Applying comparisons to a vector will return an equal-length vector of booleans.
This can be very convenient within functions such as [`all()`][ref-all] and [`any()`][ref-any]:

```R
v <- c(4, 7, 10)
v >= 6
#> [1] FALSE  TRUE  TRUE
all(v > 6)
#> [1] FALSE    # not all elements match this condition
any(v > 6)
#> [1] TRUE     # at least one element matches
```

For more complicated logical expressions, it is important to use the `&` and `|` operators, which work on vectors.
The double-character `&&` and `||` are only intended for comparing single values.

```R
v <- c(4, 7, 10)
v %% 2 == 0 & v > 5
#> [1] FALSE FALSE  TRUE
```

## Vectors are *everywhere* in R

This will be a subject to return to in later topics.
For now, just note the format of output in the console:

```R
1:20
#> [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
#> [18] 18 19 20
```

The lines start with numbers in `[ ]` to indicate the index of the first element (useful for long vectors wrapping across multiple lines).
But why are single values preceded by `[1]`?

~~~~exercism/note
*There are no truly scalar values in R!* 

What appears to be a single number or letter is actually a vector of length 1.
~~~~

## A word on notation

The vectors described above are more formally known as [`atomic vectors`][book-atomic]. This is because they can only contain simple, indivisible (hence "atomic") values such as `numeric`, `characacter`, `boolean`. More complex structures can form `recursive vectors`, which will be introduced when [`lists`][concept-lists] are discussed.

[ref-type]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/typeof.html
[ref-integer]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/integer.html
[ref-numeric]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/numeric.html
[ref-character]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/character.html
[ref-logical]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/logical.html
[ref-complex]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/complex.html
[ref-raw]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/raw.html
[ref-concatenate]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/c.html
[ref-vector]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/vector.html
[ref-seq]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/seq.html
[ref-rep]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/rep.html
[ref-tail]: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/head.html
[ref-all]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/all.html
[ref-any]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/any.html
[book-atomic]: https://r4ds.had.co.nz/vectors.html#vector-basics
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
