# Introduction

R has no separate Set datatype, instead using a variety of functions to perform similar operations on vectors.

We have already seen `%in%` to test for set membership:

```R
2 %in% 1:10 # TRUE
12 %in% 1:10 # FALSE
```

Relevant functions include `unique` to remove duplicates, plus `union()`, `intersect()` and `setdiff()` to operate on pairs of sets.

```R
> set_1 <- c("a", "b", "c", "b", "a")
> unique(set_1) # deduplicate
[1] "a" "b" "c"

> set_2 <- c('a', "c", "d")
> union(set_1, set_2) # values in either set
[1] "a" "b" "c" "d"

> intersect(set_1, set_2) # values in both sets
[1] "a" "c"

> setdiff(set_1, set_2) # values in set_1 but not set_2
[1] "b"

> setdiff(set_2, set_1)
[1] "d"
```

## The `hashtable` package

The vector operations described above are part of core R.
These are useful for small problems but become slow for large sets.

The `hashtable` package provides implementations of `hashmap` and `hashset` which scale better.
Like most external packages, this is not available within Exercism, but is worth investigating for real-world problems.
