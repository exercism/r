# Chain of boolean expressions

```r
leap <- function(year) {
  year %% 4 == 0 && (year %% 100 != 0 || year %% 400 == 0)
}
```

The first boolean expression uses the [modulo operator][arithmetic-operators] (`%%`) to check if the year is evenly divided by `4`.
- If the year is not evenly divisible by `4`, then the chain will "short circuit" due to the next operator being a [logical AND][logical-operators] `&`), and will return `FALSE`.
- If the year _is_ evenly divisible by `4`, then the year is checked to _not_ be evenly divisible by `100`.
- If the year is not evenly divisible by `100`, then the expression is `TRUE` and the chain will "short-circuit" to return `TRUE`,
since the next operator is a [logical OR][logical-operators] (`|`).
- If the year _is_ evenly divisible by `100`, then the expression is `FALSE`, and the returned value from the chain will be if the year is evenly divisible by `400`.

| year | year %% 4 == 0 | year %% 100 != 0 | year %% 400 == 0 | is leap year |
| ---- | ------------- | --------------- | --------------- | ------------ |
| 2020 |          TRUE |            TRUE |   not evaluated |         TRUE |
| 2019 |         FALSE |   not evaluated |   not evaluated |        FALSE |
| 2000 |          TRUE |           FALSE |            TRUE |         TRUE |
| 1900 |          TRUE |           FALSE |           FALSE |        FALSE |


The chain of boolean expressions is efficient, as it proceeds from testing the most likely to least likely conditions.
It is the fastest approach when testing a year that is not evenly divisible by `100` and is not a leap year.

## Refactoring

By using the [falsiness][logical-vectors] of `0`, the [not operator][logical-operators] (`!`) can be used instead of comparing equality to `0`.
For example:

```r
leap <- function(year) {
    !year %% 4 && (year %% 100 != 0 || !year %% 400)
}
```

It can be thought of as the expression _not_ having a remainder. While it may harm readability (this is of course subjective), based on benchmarking this is slightly faster than checking whether the remainder equals zero.

## Vectorised implementation

In R many operations are vectorised (by default), or can be vectorised. `|` and `&` (by contrast to `||` and `&&`) are vectorised versions of [logical operators][logical-operators] which could also be used if one wanted to allow for a vector of years as input.

```r
leap <- function(year) {
    year %% 4 == 0 & (year %% 100 != 0 | year %% 400 == 0)
}
```

In general with vectorised operations the trade-off is that it tends to be slower for operations on vectors of length 1 (R doesn't have an atomic scalar data type so scalars are still just vectors of length 1), but in many cases vectorised implementations can be more efficient than naive looping when dealing with multiple input values, and the difference can be quite dramatic for more complex computations.

[arithmetic-operators]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/Arithmetic.html
[logical-operators]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html
[logical-vectors]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/logical.html
