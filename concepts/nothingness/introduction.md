# Introduction

Many languages have a way such as `null` or `none` to indicate a non-existent value.
Because R is designed to handle large volumes of (often messy) data, it has multiple forms of nothingness.

The overall aim is to flag missing or suspect values as they are encountered, then continue without raising an exception.

## NULL

If a value really doesn't exist, it is repesented by `NULL`. This is probably closest to what C or Python might do.

```R
v <- c() # zero-length vector
v
#> NULL
is.null(v)
#> [1] TRUE
```

In many contexts, `NULL` values are simply ignored:

```R
c(2, 3, NULL, 5)
#> [1] 2 3 5
```

## NA

For situations where a value exists but we don't know what it is, `NA` is used. For example, when counting vehicles traveling on a road, human observers might go off sick or automatic sensors break down, but the traffic continues to flow.

```R
v <- c(1, 2, NA, 4, 5)
v
#> [1]  1  2 NA 4  5
is.na(v) # test for data gaps
#> [1] FALSE FALSE  TRUE FALSE FALSE
```

Thus `NA` is a placeholder, warning humans that they need to make a decision about how to handle this.

## NaN

Short for "Not a Number", `NaN` flags a computation problem in situations where a number was expected.

```R
n <- c(0, 2, 4)
d <- c(0, 1, 2)
n / d
#> [1] NaN   2   2  # 0/0 is mathematically undefined
is.nan(n / d)
#> [1]  TRUE FALSE FALSE
```

This is not the only possibility for "invalid" calculations.
Dividing by zero will return `Inf` or `-Inf` for a non-zero numerator, without raising an error.

```R
1 / 0
#> [1] Inf
```

## Empty vectors

Perhaps surprisingly, R has no standard way to check for emptiness.

Even generating an empty vector is not entirely obvious.
We saw in an earlier section that `c()` with no arguments returns `NULL`, not a vector.

```R
is.vector(c())
#> [1] FALSE
```

Functions such as `logical()` or `integer()` take an argument specifying the desired length, which can be zero.

```R
z <- logical(0)
is.vector(z)
#> [1] TRUE
length(z)
#> [1] 0
```

We can also generate a vector then remove every element, as described in the [Vectors Concept][concept-vectors].
This results in a length-0 vector of an appropriate type.

```R
v <- 5
v[-1]  # delete the first element
#> numeric(0)
```

[concept-vectors]: https://exercism.org/tracks/r/concepts/vectors
