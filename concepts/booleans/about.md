# About

The boolean values in R are `TRUE` and `FALSE`.

Boolean operators:

```R
!TRUE # FALSE (not)
TRUE && FALSE # FALSE (scalar and)
TRUE || FALSE # TRUE (scalar or)

TRUE & FALSE # FALSE (vector and)
TRUE | FALSE # TRUE (vector or)
```

Note that there are two sets of and/or operators. 
The double-character versions operate on single values. 
The single-character variants operate element-wise on vectors, returning a vector of booleans.

Using `&&` or `||` on vectors means that only fhe first element is used in the comparison, yielding a single `TRUE`/`FALSE` and probably a warning message.

This distinction will become important, and probably clearer, in the `vector-filtering` concept.
