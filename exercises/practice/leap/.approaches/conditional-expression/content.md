# Conditional expression

```r
leap <- function(year) {
    if (year %% 100 == 0)
      year %% 400 == 0
    else
      year %% 4 == 0
}
```

A [conditional expression][control-flow] uses a maximum of two checks to determine if a year is a leap year.

It starts by testing the outlier condition of the year being evenly divisible by `100`.
It does this by using the [modulo operator][arithmetic-operators] (`%%`) and checking whether the remainder is `0`.

- If the year is evenly divisible by `100`, then the expression is `TRUE`, and the conditional expression returns if the year is evenly divisible by `400`.
- If the year is _not_ evenly divisible by `100`, then the expression is `FALSE`, and the conditional expression returns if the year is evenly divisible by `4`.

| year | year %% 100 == 0 | year %% 400 == 0 | year %% 4 == 0  | is leap year |
| ---- | --------------- | --------------- | -------------- | ------------ |
| 2020 |           FALSE |   not evaluated |           TRUE |        TRUE  |
| 2019 |           FALSE |   not evaluated |          FALSE |       FALSE  |
| 2000 |           TRUE  |            TRUE |  not evaluated |        TRUE  |
| 1900 |           TRUE  |           FALSE |  not evaluated |        FALSE |

Although it uses a maximum of only two checks, the conditional expression tests an outlier condition first,
making it less efficient than another approach that would first test if the year is evenly divisible by `4`,
which is more likely than the year being evenly divisible by `100`.
The conditional expression was fastest in benchmarking when the year was a leap year or was evenly divisible by `100`,
but those are the least likely conditions.

In R many operations are vectorised (by default), or can be vectorised. [`ifelse`][ifelse] is a vectorised version of `if ... else ...`, which could also be used if one wanted to allow for a vector of years as input.

```r
leap <- function(year) {
    ifelse(year %% 100 == 0, year %% 400 == 0, year %% 4 == 0)
}
```

In general with vectorised operations the trade-off is that it tends to be slower for operations on vectors of length 1 (R doesn't have an atomic scalar data type so scalars are still just vectors of length 1), but in many cases vectorised implementations can be more efficient than naive looping when dealing with multiple input values, and the difference can be quite dramatic for more complex computations.

[control-flow]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/Control.html
[arithmetic-operators]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/Arithmetic.html
[ifelse]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/ifelse.html
