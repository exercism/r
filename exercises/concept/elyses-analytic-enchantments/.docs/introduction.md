# Introduction

We saw in the `vectors` concept that a vector can be used in a conditional expression, giving a vector of booleans. This in turn can be used in functions such as `all()` and `any()`.

```R
> v <- c(4, 7, 10)
> v >= 6
[1] FALSE  TRUE  TRUE
> all(v > 6)
[1] FALSE    # not all elements match this condition
> any(v > 6)
[1] TRUE     # at least one element matches
```

The technique is much more powerful than this.

## Array subsets

Selected elements of an array can be pulled out with an index number or a vector of indices:

```R
> v <- 5:10
> v
[1]  5  6  7  8  9 10
> v[3] 
[1] 7
> v[c(2, 4)]
[1] 6 8
```

Alternatively, use a vector of booleans to filter the original vector, returning a subset of entries matched to a `TRUE` value:

```R
> v <- 1:3
> bools <- c(FALSE, TRUE, TRUE)
> v[bools]
[1] 2 3
```

It is a small step from there to generating the boolean vector with a conditional expression:

```R
> v[v >= 2]
[1] 2 3
```

## Finding indices

The `which()` function takes a boolean argument and returns a vector of indices that yield `TRUE`.

```R
> v
[1] 2 7 9

> v[v > 5]  # returns values
[1]  7  9

> which(v > 5) # returns indices
[1] 2 3
```
