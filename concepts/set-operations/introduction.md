# Introduction

R has no separate Set datatype, instead using a variety of functions to perform similar operations on vectors.

We have already seen `%in%` to test for set membership:

```R
2 %in% 1:10 # TRUE
12 %in% 1:10 # FALSE
```

Relevant functions include `unique` (to remove duplicates), `union()`, `intersect()` and `setdiff()` to operate on pairs of sets.
Details are available online.
