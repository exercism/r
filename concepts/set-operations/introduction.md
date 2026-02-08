# Introduction

R has no separate Set datatype, instead using a variety of functions to perform similar operations on vectors.

The `%in%` operator tests for set membership.

```R
2 %in% 1:10 # TRUE
12 %in% 1:10 # FALSE
```

Relevant functions include `unique` (to remove duplicates), plus `union()`, `intersect()`, `setdiff()` and `setequal()` to operate on pairs of sets.

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

> setdiff(set_2, set_1) # values in set_2 but not set_1
[1] "d"

setequal(set_1, c("c", "b", "a", "b")) # are elements the same after deduplication?
[1] TRUE
```
