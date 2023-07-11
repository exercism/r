# Introduction

There are many options for generating random values, and these are a few common ones.

## Discrete values with `sample`

To pick from a limited number of discrete values, `sample()` can be used with or without replacement (i.e. is it permitted to get repeated values?).
This is useful for integers, strings, etc.

```R
> sample(1:10, 5) # no repeats
[1] 8 3 4 2 6

> sample(1:10, 5, replace = TRUE) # repeats are OK
[1] 10 10  7 10  9

> languages <- c("Fortran", "R", "Python", "Julia")
> sample(languages, 1)
[1] "Python"

> sample(c(TRUE, FALSE), 5, replace = TRUE) # coin flips
[1] FALSE  TRUE FALSE  TRUE  TRUE
```

## Floating-point numbers

For a random-uniform distribution use `runif()`.
Both `min` and `max` can be specified but default to 0 and 1.

```R
> runif(5)
[1] 0.3038506 0.3527959 0.3319309 0.4846354 0.4386279

> runif(5, max = 100)
[1] 79.70762 51.62232 52.85281 71.08571 63.94380
```
