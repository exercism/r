# About

When handling collections of homogeneous atomic data (e.g. all numeric or all character), the following structures are available in R:

- `vector` for 1-dimensional data, accessed with a single index.
- `matrix` for 2-dimensional, rectangular (not ragged) data.
- `array` for the general N-dimensional case. A `matrix` is just an `array` with N=2.

~~~~exercism/note
**For Python programmers**: This section may look familiar. 

Any resemblance to NumPy is not coincidental (but R is slightly older, and has all this in the base language).
~~~~

## Matrices

A matrix is essentially just a vector, plus row and column counts to define the shape.

There is a [`matrix()`][ref-matrix] function to create them:

```R
# data already available 
matrix(1:6, nrow=2, ncol=3)
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6

# empty matrix to be filled in later
matrix(nrow=2, ncol=3)
#>      [,1] [,2] [,3]
#> [1,]   NA   NA   NA
#> [2,]   NA   NA   NA
```

Note that the data is stored in column-major order (i.e. down then across).

Find the dimensions of a matrix with [`dim()`][ref-dim] for both rows and columns, [`nrow()`][ref-nrow] or [`ncol()`][ref-nrow] to get a single dimension.
Using [`length()`][ref-length] will just return the length of the underlying vector (6 in the example above).

Some other functions create matrix output, for example [`str_split_fixed()`][ref-str_split_fixed].

```R
library(stringr)

str_split_fixed(c("split some words", "and some more"), " ", 3)
#>      [,1]    [,2]   [,3]   
#> [1,] "split" "some" "words"
#> [2,] "and"   "some" "more" 
```

## Matrix indexing

This works in all the same ways as vector indexing, except for the need to specify row(s) and column(s), in that order.
Leave a dimension empty to get the entire row/column.

Using the same matrix as above:

```R
m <- matrix(1:6, nrow=2, ncol=3)
m
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6

m[2, 3]    # row 2, col 3
#> [1] 6

m[1:2, 3]  # rows 1:2, col 3
#> [1] 5 6

 m[2, ]    # all of row 2
#> [1] 2 4 6
```

Note that a subset with a single row and/or column will be returned as a vector, not a matrix.

```R
class(m)
#> [1] "matrix" "array" 
class(m[2,])
#> [1] "integer"
```

This type of `dimension reduction` is not always wanted, especially in a function pipeline that expects matrix inputs.

Specifying `drop=FALSE` will guarantee a matrix return value from matrix input.
Note that a matrix with only one row or one column is _not_ the same type as a vector.

```R
m[2, , drop = FALSE]
#>      [,1] [,2] [,3]
#> [1,]    2    4    6
```

The [`as.matrix()`][ref-matrix] function converts a vector to a single-column matrix.

```R
as.matrix(1:3)
#>      [,1]
#> [1,]    1
#> [2,]    2
#> [3,]    3
```

As with vectors, portions of a matrix can be modified simply by assigning new values.

```R
m[, 2] <- c(10, 20)
m
#>      [,1] [,2] [,3]
#> [1,]    1   10    5
#> [2,]    2   20    6
```

## Adding and deleting rows/columns

With vectors, the [`c()`][ref-c] function was sufficient to insert and append data. 
Matrices have more structure so need more care in specifying what is required.

The [`rbind()`][ref-cbind] and [`cbind()`][ref-cbind] functions bind new row(s) or column(s) to the matrix.

```R
m
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6
m2 <- matrix(7:9, nrow = 1, ncol = 3)

rbind(m, m2)
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6
#> [3,]    7    8    9
```

## Filtering and functions

All the vector functions will also work on matrices, applied across all elements.
However, they may lose the matrix structure and return a vector.

```R
sqrt(m)
#>          [,1]     [,2]     [,3]
#> [1,] 1.000000 1.732051 2.236068
#> [2,] 1.414214 2.000000 2.449490

sum(m)
#> [1] 21

m[m > 3]
#> [1] 4 5 6
```

For matrices, the [`colSums()`][ref-colsums] and [`rowSums()`][ref-colsums] functions may also be useful.

Dimension reduction is intended in this case, so the return values are vectors.

```R
# m as defined above
rowSums(m)
#> [1]  9 12
colSums(m)
#> [1]  3  7 11
```

Similarly, there are `rowMeans()` and `colMeans()` functions for calculating averages.

## General functions operating on matrices

In other concepts, we have seen that Tidyverse libraries can simplify operations on vectors and lists ([`purrr`][concept-functional-progamming]) or dataframes ([`dplyr`][concept-dataframes]).

However, matrices and arrays are mostly out of scope for Tidyverse inputs (at least for now).

The [`apply()`][ref-apply] function is part of Base R, and still the best tool for finer control over matrix programming.

The parameters, in order, are:

1. The input matrix.
2. The dimension to operate on (1 for rows, 2 for columns).
3. The function to apply.
4. Optionally, any extra parameters for the function.

The [`rowMeans()`][ref-colsums] function exists in Base R, but we could also simulate it with `apply()` and `mean()`.

```R
randm <- sample(1:10, 16, replace = TRUE) |> matrix(4, 4)
randm
#>      [,1] [,2] [,3] [,4]
#> [1,]    4    9    8    3
#> [2,]    6    8    5    5
#> [3,]    4    2    1    2
#> [4,]    4    2    5    4

apply(randm, 1, mean)
#> [1] 6.00 6.00 2.25 3.75

rowMeans(randm)
#> [1] 6.00 6.00 2.25 3.75
```

## Linear algebra

~~~~exercism/note
*This section assumes a level of mathematical knowledge outside the scope of Exercism.*

Please skip it if it makes no sense to you.

However, R is a data science language, and many users have a background in applied mathematics and statistics.
This terse summary may be of interest to some students.
~~~~

Modern R is "obviously" a data science language: designed to work mainly with tabular data, and popular with users such as statisticians, epidemiologists and social scientists.
The main competitor in this field is the Python scientific stack, including packages such as Pandas or Polars.

However, in earlier decades R was also seen as a potential engineering language, competing directly with Matlab.

Perhaps surprisingly, Base R still supports a full range of linear algebra operations on vectors and matrices.
It is not clear how much these now feature in end-user code, but such techniques remain very important _internally_ for implementing statistical functions.

LinAlg in R is still taught in some college courses, such as this [econometrics class][web-econ407].
A good guide to the mathematics (not programming) is on [3Blue1Brown][3blue1brown].

The most complete discussion of linear algebra within Exercism is in the Julia syllabus (same authors as the R syllabus).
We believe that Julia (or Python in contexts where the `numpy.linalg` module is available) would now be a more appropriate language for serious linear algebra work than R.

- [Linear Algebra Basics][concept-linalg-basics] in Julia
- [Linear Equation Solving][concept-lin-eq-solving] in Julia

### Diagonals

The main diagonal of a _square_ matrix runs from top left (`A[1,1]`) to bottom right.

The [`diag()`][ref-diag] function behaves differently, depending on the argument passed to it.

With a vector `v`, `diag(v)` creates a diagonal matrix.

```R
diag(1:3)
#>      [,1] [,2] [,3]
#> [1,]    1    0    0
#> [2,]    0    2    0
#> [3,]    0    0    3
```

With a matrix `A`, `diag(A)` returns the elements on the main diagonal as a vector.

```R
A
#>      [,1] [,2] [,3]
#> [1,]   10    5    2
#> [2,]    9    3    7
#> [3,]    8   10    4
diag(A)
#> [1] 10  3  4
```

With a single integer `k`, `diag(k)` creates a `k × k` identity matrix.
Even serious R textbooks tend to add comments like _"Go figure"_ at this point.

```R
diag(3)
#>      [,1] [,2] [,3]
#> [1,]    1    0    0
#> [2,]    0    1    0
#> [3,]    0    0    1
```

### Transpose and inverse

To exchange rows and columns, the [`t()`][ref-t] function will transpose any matrix.

```R
m
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6
t(m)
#>      [,1] [,2]
#> [1,]    1    2
#> [2,]    3    4
#> [3,]    5    6
```

For a complex-valued matrix, the result is _not_ the complex conjugate.
Use `Conj(t(A))` to get the conjugate transpose (adjoint) of matrix `A`.

For higher-dimensional arrays, [`aperm()`][ref-aperm] will permutate dimensions.

For the inverse of a square matrix `A` we can use [`solve(A)`][ref-solve].
Some of us find this syntax ... _unexpected_.

Multiplying a matrix by its inverse gives the identity matrix (subject to very small roundoff errors).

```R
A <- matrix(sample(1:10, 9, replace = TRUE), 3, 3)
A
#>      [,1] [,2] [,3]
#> [1,]   10    5    2
#> [2,]    9    3    7
#> [3,]    8   10    4

solve(A)
#>             [,1]        [,2]        [,3]
#> [1,]  0.16666667  0.00000000 -0.08333333
#> [2,] -0.05747126 -0.06896552  0.14942529
#> [3,] -0.18965517  0.17241379  0.04310345

A %*% solve(A) |> round(digits = 10)
     [,1] [,2] [,3]
#> [1,]    1    0    0
#> [2,]    0    1    0
#> [3,]    0    0    1
```

### Multiplication

The usual arithmetic operators such as `+`, `-`, `*`, `^` operate on matrices element-wise.
If there is a dimension mismatch, the usual rules of [reycling][concept-vector-filtering] apply.

```R
m
#>      [,1] [,2] [,3]
#> [1,]    1    3    5
#> [2,]    2    4    6

m * m
#>      [,1] [,2] [,3]
#> [1,]    1    9   25
#> [2,]    4   16   36

# same calculation, different syntax
m ^ 2
#>      [,1] [,2] [,3]
#> [1,]    1    9   25
#> [2,]    4   16   36
```

Explaining the various other types of vector and matrix multiplication is beyond our scope.
In very brief summary:

- `%*%` is the infix operator form of [`matmult()`][ref-matmult], which gives the [matrix product][wiki-matrix-product].
- `%o%` is the infix operator form of [`outer()`][ref-outer], which gives the [outer product][wiki-outer-product].
- [`crossprod()`][ref-crossprod] gives the [cross product][wiki-cross-product].

[ref-matrix]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/matrix
[ref-str_split_fixed]: https://stringr.tidyverse.org/reference/str_split.html
[ref-dim]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/dim
[ref-nrow]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/nrow
[ref-length]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/length
[ref-c]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/c
[ref-cbind]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/cbind
[ref-colsums]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/colSums
[ref-apply]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/apply
[ref-t]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/t
[ref-diag]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/diag
[ref-aperm]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/aperm
[ref-matmult]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/matmult
[ref-outer]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/outer
[ref-crossprod]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/crossprod
[ref-solve]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/solve
[web-econ407]: https://econ.pages.code.wm.edu/407/notes/docs/R_linalg.html
[concept-functional-progamming]: https://exercism.org/tracks/r/concepts/functional-programming
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
[concept-dataframes]: https://exercism.org/tracks/r/concepts/dataframes
[3blue1brown]: https://www.3blue1brown.com/topics/linear-algebra
[concept-linalg-basics]: https://exercism.org/tracks/julia/concepts/linear-algebra-basics
[concept-lin-eq-solving]: https://exercism.org/tracks/julia/concepts/linear-equation-solving
[wiki-matrix-product]: https://en.wikipedia.org/wiki/Matrix_multiplication
[wiki-outer-product]: https://en.wikipedia.org/wiki/Outer_product
[wiki-cross-product]: https://en.wikipedia.org/wiki/Cross_product
