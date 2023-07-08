# About

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

These conditional expressions can be arbitrarily complex, involving multiple vectors or functions:

```R
> v <- 1:10
> w <- 10:1
> v[v > w]
[1]  6  7  8  9 10
```

## Recycling

For simplicity, the examples above all compared vectors of the same length.
What happens if the lengths are mismatched?

The answer is something powerful if used deliberately but confusing if unexexpected.

An example:

```R
> v <- 1:6
> cond <- c(TRUE, FALSE)
> v[cond]
[1] 1 3 5
```

What happened there?
We indexed a length-6 vector with a length-2 boolean, but got a length-3 vector as a result.

If a vector is somehow "too short" for the expression it is used in, R will repeat it until the desired length is reached: called "recycling".
This turned our `c(TRUE, FALSE)` vector into `c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)` and `v[cond]` then returned the `TRUE` values of `v`, in this case, the odd numbers.

So what is happening in the next example?

```R
> v <- 1:3
> 0.5 * v
[1] 0.5 1.0 1.5
> 2 + v
[1] 3 4 5
```

It looks at first like scalar multiplication and (a slightly odd) scalar addition, but there are no scalars in R.

Instead, the numbers are recyled to get a vector matching the length of `v`, then the arithmetic operation is applied element-wise using `c(0.5, 0.5, 0.5)` or `c(2, 2, 2)`.

Very, very useful, but make sure this is what you intend. 
A slight mismatch in vector lengths (e.g. 99 vs 100) can cause confusing bugs.
Some authors recommend that recycling should only be used when one of the vectors has length 1.
