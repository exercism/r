# About

## Booleans in R

True or false values are represented by the `logical` type.
It contains only two values: `TRUE` and `FALSE`.

```R
TRUE
#> [1] TRUE
FALSE
#> [1] FALSE
typeof(TRUE)
#> [1] "logical"
```

## Boolean Operators

There are five Boolean operators in R.

```R
!TRUE # FALSE (not)
TRUE && FALSE # FALSE (scalar and)
TRUE || FALSE # TRUE (scalar or)

TRUE & FALSE # FALSE (vector and)
TRUE | FALSE # TRUE (vector or)
```

`&&` and `&` are Boolean "and".
They evaluate to `TRUE` if the expressions on *both* sides of `&&` are `TRUE`.

`||` and `|` are Boolean "or".
They evaluate to `TRUE` if an expression on *either* side of `||` is `TRUE`.

Note that there are two sets of and/or operators.

- The double-character versions operate on single values.
- The single-character variants operate element-wise on vectors, returning a vector of booleans.

This distinction will become important, and probably clearer, in the [`vector-filtering`][concept-vector-filtering] concept.

Using `&&` or `||` on vectors (length 2 or more) means that only the first element is used in the comparison, yielding a single `TRUE`/`FALSE` and probably a warning message.
_This is probably not what you intended._

`!` is Boolean "not".
It exchanges `TRUE` and `FALSE` values.

```R
!TRUE
#> [1] FALSE
!FALSE
#> [1] TRUE
```

For longer and more complicated expressions, it is best to use parentheses to make your intention clear.

```R
(TRUE || FALSE) && (FALSE && TRUE)
#> [1] FALSE
```

There is no infix operator for [exclusive or][wiki-xor] (i.e. A OR B, but not both). The [`xor()`][ref-xor] function can be used in this case.

```r
xor(TRUE, FALSE)
#> [1] TRUE
xor(TRUE, TRUE)
#> [1] FALSE
```

[wiki-xor]: https://en.wikipedia.org/wiki/Exclusive_or
[ref-xor]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
