# About

## Comparison operators

R has a set of operators that is the same as many other languages:

```R
1 == 2 # FALSE
1 != 2 # TRUE
1 < 2 # TRUE
1 > 2 # FALSE
1 <= 2 # TRUE
1 >= 2 # FALSE
```

## Branching

The basic form of an if-then-else is:

```R
if (x > 10) {
    y <- "big"
} else if (x > 2) {
    y <- "medium"
} else {
    y <- "tiny"
}
```

In this case, parentheses `( )` around the boolean and braces `{ }` around the body are both required.

A simple `if` statement can be shortened:

```R
if (x == 0) return("success")
```

## Using vectors in conditionals

Looking ahead to the [`vector-filtering`][concept-vector-filtering] concept: the conditional clause in parentheses `()` must evaluate to a single `TRUE`/`FALSE`.

Including vectors in the comparison usually gives a vector of booleans, so these will need to be wrapped in an aggregating function such as [`all()`][ref-all] (are all values TRUE?) or [`any()`][ref-any] (is at least one value TRUE).

```R
numbers <- c(4,5,7,9,10,11)
numbers %% 3 == 0 # gives vector of booleans
#> [1] FALSE FALSE FALSE  TRUE FALSE FALSE

# use any() to get a single TRUE/FALSE
if (any(numbers %% 3 == 0)) print("1 or more numbers are divisible by 3")
#> [1] "1 or more numbers are divisible by 3"
```

## The [`ifelse`][ref-ifelse] function

An alternative if-else form may be useful, provided there is only a true/false outcome.

```R
y <- ifelse(x > 8, "big", "small")

# Don't mix result types:
z <- ifelse(x > 100, 100, "small") # numeric or string result? Expect problems!
```

`ifelse()` takes exactly three parameters:

1. boolean clause
2. value if `TRUE`
3. value if `FALSE`.

Vector inputs are acceptable, and then a vector output is produced. 
In this case, ensure both branches result in the same type of data: numeric, character, logical, etc.
This will be covered in the [`vector-functions`][concept-vector-functions] concept.

## The [`if_else`][ref-if_else] function

### Background

The R language maintainers have a policy of avoiding breaking changes as far as possible.
This helps maintain the vast number of third-party packages available in [CRAN][web-cran], but limits the ability to update base R with modern programming concepts.

In recent years, several packages have been released which extend and sometimes replace R functionality, based on multi-decade experience of the strengths and weaknesses of the original R design.

These packages form the [`tidyverse`][web-tidyverse] collection.
They were added to the Exercism test runner in 2023, and are available for you to use in exercises.

Our R track predates addition of the tidyverse by several years, so you may notice that many community solutions stick to the base language.

### The [`dplyr`][ref-dplyr] package

`dplyr` is mostly about manipulating dataframes (to be covered later in the course).

Add it with either `library(dplyr)` at the top of your code, or `library(tidyverse)` to add the whole collection.
You may see warning messages about masked names, but this is rarely a problem.

For the present Concept, the [`if_else`][ref-if_else] function is worth mentioning.
It is mostly similar to [`ifelse`][ref-ifelse] in base R.

```R
library(dplyr) # warnings not shown

x <- 10
if_else(x > 8, "big", "small")
#> [1] "big"
```

The main difference is that `if_else` can take an optional fourth argument, for [missing][concept-nothingness] values that are represented in R by [`NA`][ref-na].

```R
xs <- c(10, 3, NA)  # a 3-element vector
xs
#> [1] 10  3 NA
if_else(xs 8, "big", "small", "missing")
#> [1] "big"     "small"   "missing"

# contrast:
ifelse(xs > 8, "big", "small")
#> [1] "big"   "small" NA 
```

You may also find that `if_else` has better error messages than the older `ifelse`.

After loading the `dplyr` library, you will also have access to the [`between()`][ref-between] function.

R does not allow chaining of comparisons, so `1 <= x <= 5` will give an error message.
With `dplyr` loaded, `between(x, 1, 5)` is equivalent to `x >= 1 & x <= 5`, and perhaps more readable.
Both lower and upper limits are inclusive.


[wiki-xor]: https://en.wikipedia.org/wiki/Exclusive_or
[ref-xor]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html
[ref-all]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/all.html
[ref-any]: https://stat.ethz.ch/R-manual/R-patched/library/base/html/any.html
[ref-ifelse]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/ifelse.html
[ref-if_else]: https://dplyr.tidyverse.org/reference/if_else.html
[ref-na]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/NA.html
[ref-dplyr]: https://dplyr.tidyverse.org/
[ref-between]: https://dplyr.tidyverse.org/reference/between.html
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
[concept-vector-functions]: https://exercism.org/tracks/r/concepts/vector-functions
[concept-nothingness]: https://exercism.org/tracks/r/concepts/nothingness
[web-cran]: https://cran.r-project.org/
[web-tidyverse]: https://tidyverse.org/
