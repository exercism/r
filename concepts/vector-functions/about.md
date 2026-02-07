# About

This is a big concept in R.
To help make sense of the possibilities, it can be useful to consider the dimensionality of the input(s) and output of the various functions.

## Vector-in, scalar-out

We already saw functions that take in a vector and return a single, scalar-like value:

```R
v <- 1:5
length(v)
#> [1] 5
sum(v)
#> [1] 15
```

Many statistical functions are also in this category, such as [`mean()`][ref-mean].

For logical vectors, there are [`all()`][ref-all] and [`any()`][ref-any], which return a single `TRUE` or `FALSE`.

## Vector-in, vector-out

Many functions in R will operate on entire vectors, often giving vector output.
This includes most of the mathematical functions:

```R
sq <- c(4, 9, 16, 25)
sqrt(sq) # square root
#> [1] 2 3 4 5
```

This is not just concise and convenient, avoiding the need for loops, list comprehensions or [recursion][wiki-recursion] which are common in other languages.
In R, vector functions often run much faster than those techniques.

You already used vectorized functions more than you probably realized. Compare these:

```R
v <- c(2, 7, 9)
w <- c(3, 1, 5)
v + w
#> [1]  5  8 14
"+"(v, w)
#> [1]  5  8 14
```

The familiar infix operators are just syntactic sugar for the underlying vectorized function! In this case `"+"()`.

For sorting a vector, there is [`sort()`][ref-sort] to return the values and [`order()`][ref-order] to return the indices:

```R
v <- c("I", "am", "not", "in", "order")
sort(v)
#> [1] "am"    "I"     "in"    "not"   "order"
order(v)
#> [1] 2 1 4 3 5
```

There are also functions such as [`cumsum()`][ref-cumsum] and [`cumprod()`][ref-cumprod] to produce cumulative vector outputs, operating on the input vector left-to-right:

```R
cumsum(1:5)
#> [1]  1  3  6 10 15  # sums
cumprod(1:5)
#> [1]   1   2   6  24 120 # equivalent to factorials
```

The above examples are similar to [`foldl`][wiki-foldl] operations in many functional languages, except that the output is a vector with all the intermediate values.

## Multiple-vectors-in, vector-out

An extension of this concept can also be used to compare vectors.
For example, consider the pairwise-max function [`pmax()`][ref-pmax]:

```R
v
#> [1] 2 7 9
w
#> [1] 3 1 5
pmax(v, w)
#> [1] 3 7 9 # max of each pairwise comparison
```

This function and others like it also accept an arbitrary number of input vectors, not just two.

## Vector-in, matrix-out

This is less common, but it is fairly easy to write functions that are apparently scalar-in, vector out.
When applied to vector input, the output is a 2-D `matrix` (covered in a [later concept][concept-arrays-matrices]).

[ref-all]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/all.html
[ref-any]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/any.html
[ref-mean]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/mean.html
[ref-sort]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/sort.html
[ref-order]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/order.html
[ref-cumsum]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/cumsum.html
[ref-cumprod]: https://search.r-project.org/CRAN/refmans/bimets/html/CUMPROD.html
[ref-pmax]: https://search.r-project.org/CRAN/refmans/Rmpfr/html/pmax.html
[wiki-recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[wiki-foldl]: https://en.wikipedia.org/wiki/Fold_(higher-order_function)
[concept-arrays-matrices]: https://exercism.org/tracks/r/concepts/arrays-matrices
