# Introduction

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

There are five Boolean operators in R, but only three are relevant at this stage of the syllabus.
The other two will be important when working with vectors, covered in several later Concepts.

`&&` is Boolean "and".
It evaluates to `TRUE` if the expressions on *both* sides of `&&` are `TRUE`.

```R
TRUE && TRUE
#> [1] TRUE
TRUE && FALSE
#> [1] FALSE
```

`||` is Boolean "or".
It evaluates to `TRUE` if an expression on *either* side of `||` is `TRUE`.

```R
TRUE || TRUE
#> [1] TRUE
FALSE || TRUE
#> [1] TRUE
```

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
