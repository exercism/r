# Introduction

There are various idiomatic approaches to solve Leap.
You can use a chain of boolean expressions to test the conditions.
Or you can use a [conditional expression][control-flow].

## General guidance

The key to solving Leap is to know if the year is evenly divisible by `4`, `100` and `400`.
For determining that, you will use the [modulo operator][arithmetic-operators] (`%%`) to check whether the remainder is `0`.

## Approach: Chain of Boolean expressions

```r
leap <- function(year) {
  year %% 4 == 0 && (year %% 100 != 0 || year %% 400 == 0)
}
```

For more information, check the [Boolean chain approach][approach-boolean-chain].

## Approach: Conditional expression

```r
leap <- function(year) {
  if (year %% 100 == 0)
    year %% 400 == 0
  else
    year %% 4 == 0
}
```

For more information, check the [conditional expression approach][approach-conditional-expression].

## Which approach to use?

- The chain of boolean expressions should be the most efficient, as it proceeds from the most likely to least likely conditions.
It has a maximum of three checks.
It is the fastest approach when testing a year that is not evenly divisible by `100` and is not a leap year.
Since most years fit those conditions, it is the most efficient approach overall.
- The conditional expression approach has a maximum of only two checks, but it starts from a less likely condition.
The conditional expression approach was faster in benchmarking when the year was a leap year or was evenly divisible by `100`,
but those are the least likely conditions.

[control-flow]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/Control.html
[arithmetic-operators]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/Arithmetic.html
[approach-boolean-chain]: https://exercism.org/tracks/r/exercises/leap/approaches/boolean-chain
[approach-conditional-expression]: https://exercism.org/tracks/r/exercises/leap/approaches/conditional-expression
