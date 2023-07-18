# About

This is a big concept in R.
To help make sense of the possibilities, it can be useful to consider the dimensionality of the input(s) and output of the various functions.

## Vector-in, scalar-out

We already saw functions that take in a vector and return a single, scalar-like value:

```R
> v <- 1:5
> sum(v)
[1] 15
> length(v)
[1] 5
```

Many statistical functions are also in this category, such as `mean()`.

For logical vectors, there are `all()` and `any()`, which return a single `TRUE` or `FALSE`.

## Vector-in, vector-out

Many functions in R will operate on entire vectors, often giving vector output.
This includes most of the mathematical functions:

```R
> sq <- c(4, 9, 16, 25)
> sqrt(sq) # square root
[1] 2 3 4 5
```

This is not just concise and convenient, avoiding the need for loops, list comprehensions or recursion.
In R, vector functions often run much faster than these more familiar techniques.

You already used vectorized functions more than you probably realized. Compare these:

```R
> v <- c(2, 7, 9)
> w <- c(3, 1, 5)
> v + w
[1]  5  8 14
> "+"(v, w)
[1]  5  8 14
```

The familiar infix operators are just syntactic sugar for the underlying vectorized function! In this case `"+"()`.

For sorting a vector, there is `sort()` to return the values and `order()` to return the indices:

```R
> v <- c("I", "am", "not", "in", "order")
> sort(v)
[1] "am"    "I"     "in"    "not"   "order"
> order(v)
[1] 2 1 4 3 5
```

There are also functions to produce cumulative vector outputs, operating on the input vector left-to-right:

```R
> cumsum(1:5)
[1]  1  3  6 10 15  # sums
> cumprod(1:5)
[1]   1   2   6  24 120 # factorials, for a range like this
```

## Multiple-vectors-in, vector-out

An extension of this concept can also be used to compare vectors.
For example, consider the pairwise-max function `pmax()`:

```R
> v
[1] 2 7 9
> w
[1] 3 1 5
> pmax(v, w)
[1] 3 7 9 # max of each pairwise comparison
```

This function and others like it also accept an arbitrary number of input vectors, not just two.

## Vector-in, matrix-out

Less common, but it is fairly easy to write functions that are apparently scalar-in, vector out.
When applied to vector input, the output is a 2-D `matrix` (covered in a later concept).
