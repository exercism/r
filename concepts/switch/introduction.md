# Introduction

The `switch()` function can be a concise replacement for a long series of `if` ... `else if` tests.
The variable being switched on is most commonly a string, and if so the quotes can be omitted from the selector.

```R
star <- function(type) {
  switch(type,
    M = , # will "fall through" if no value given
    K = "red dwarf",
    G = "Earth-like",
    "bigger star" # only correct for O,B,A,F
  )
}

> star("M")
[1] "red dwarf"
```

Note that options will only fall through if the value is left blank, as with `M` in the example above.
There is no need to include `break` statements as with some other languages.

When switching on `character` types, the final value is a default, as here.
With integer types, no default can be given.

## Functions in `dplyr`

The `switch` in base R is quite limited: it will only do an exact match to a single input.
This seemed reasonable when R was first released in 1993, but needs improvement for modern usage.

The `tidyverse` collection of packages is designed to supplement (and sometimes replace) base R functionality without impacting backwards compatibility.

The tidyverse packages also have excellent, modern documentation.

The `dplyr` package can be brought into scope by adding either `library(dplyr)` (for the single package) or `library(tidyverse)` (for the whole collection) to the top of your code.

There are then two extra functions related to `switch`.

### The `case_match` function

`case_match` is essentially a vectorized version of `switch`, with some extra options.

Matching is still exact, but:

- The options on the left can be vectors, and the input matches if any element matches.
- Options on the left and results on the right are linked with a tilde `~` instead of `=`.
- Missing values `NA` can be matched explicitly (this will be discussed in the [Nothingness][concept-nothingness] Concept).
- A default can be specified in all cases.

```R
library(dplyr)

x <- c("a", "b", "a", "d", "b", NA, "c", "e")
case_match(
  x,
  "a" ~ 1,
  "b" ~ 2,
  "c" ~ 3,
  c("d", "e") ~ 4, # either "d' or "e" will match
  NA ~ 0,          # matches missing values
  .default = 100   # note the different syntax for the default
)
#> [1] 1 2 1 4 2 0 3 4
```

### The `case_when` function

`case_when` takes `case_match` syntax a stage further, by allowing any logical expression on the left of the `~`.

The input vector (`x` in the example below) is not supplied as an argument, it just needs to be already defined.

```R
x <- 1:10
case_when(
  x < 3 ~ "low",
  between(x, 3, 5) ~ "mid",
  between(x, 6, 8) ~ "high",
  .default = "what?"
)
#>  [1] "low"   "low"   "mid"   "mid"   "mid"   "high"  "high"  "high"  "what?" "what?"
```

The `between()` function is also part of `dplyr`.

[concept-nothingness]: https://exercism.org/tracks/r/concepts/nothingness
