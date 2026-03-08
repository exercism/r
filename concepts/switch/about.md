# About

The [`switch()`][ref-switch] function can be a concise replacement for a long series of `if` ... `else if` tests.
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

The final value can be a default, as here, or a [`stop()`][ref-stop] to throw an error if the conditions are intended to be exhaustive.
Switching on an integer is slightly different: for these the default is always `NULL` (which will be discussed in the [Nothingness Concept][concept-nothingness]).

## Functions in `dplyr`

The `switch` in base R is quite limited: it will only do an exact match to a single input.
This seemed reasonable when R was first released in 1993, but needs improvement for modern usage.

~~~~exercism/note
As mentioned in the [`Conditionals`][concept-conditionals] Concept, the [`tidyverse`][web-tidyverse] collection of packages is designed to supplement (and sometimes replace) base R functionality without impacting backwards compatibility.

The tidyverse packages also have excellent, modern documentation, so following the links below will give more detail.

The [`dplyr`][ref-dplyr] package can be brought into scope by adding either `library(dplyr)` (for the single package) or `library(tidyverse)` (for the whole collection) to the top of your code.

[concept-conditionals]: https://exercism.org/tracks/r/concepts/conditionals
[web-tidyverse]: https://tidyverse.org/
[ref-dplyr]: https://dplyr.tidyverse.org/
~~~~

The `dplyr` library provides two extra functions related to `switch`.

#### The [`recode_values`][ref-recode_values] and [`replace_values`][ref-recode_values] functions

These two related functions allow a vectorized switch-like mapping of old values to new values.

The main difference between them is that `recode_values()` creates an entirely new vector, while `replace_values()` allows partial updates of an existing vector.

Matching is still exact, but:

- The options on the left can be vectors, and the input matches if any element matches.
- Options on the left and results on the right are linked with a tilde `~` instead of `=`.
- Missing values `NA` can be matched explicitly (this will be discussed in the [Nothingness][concept-nothingness] Concept).
- A default can be specified in all cases.

```R
library(dplyr)

x <- c("a", "b", "a", "d", "b", NA, "c", "e", "z")
recode_values(
  x,
  "a" ~ 1,
  "b" ~ 2,
  "c" ~ 3,
  c("d", "e") ~ 4, # either "d' or "e" will match
  NA ~ 0,          # matches missing values
  default = 100   # note the different syntax for the default
)
#> [1]   1   2   1   4   2   0   3   4 100
```

~~~~exercism/note
You may see advice online about using the `case_match()` function as a vectorized `switch`.

This function was deprecated in `dplyr` version 1.2.0 (February 2026).
Attempts to use it will now produce a warning message, advising use of `recode_values()` instead.
~~~~

### The [`case_when`][ref-case_when] function

[`case_when`][ref-case_when] takes `case_match` syntax a stage further, by allowing any logical expression on the left of the `~`.

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

The [`between()`][ref-between] function is also part of `dplyr`.

[String functions][concept-strings] were already discussed and [Regular Expressions][concept-regex] will be the subject of a later concept.
These combine very well with `case_when`.

```R
library(stringr)

tracks <- "R C Python C# Elixir C++ Odin" |> str_split_1(" ")
tracks
#> [1] "R"      "C"      "Python" "C#"     "Elixir" "C++"    "Odin"  

case_when(
  str_starts(tracks, "C") ~ "C-like",
  str_starts(tracks, "[AEIOU]") ~ "vowel",
  .default = "other"
)
#> [1] "other"  "C-like" "other"  "C-like" "vowel"  "C-like" "vowel"
```

[ref-switch]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/switch
[ref-stop]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/stop
[ref-recode_values]: https://dplyr.tidyverse.org/reference/recode-and-replace-values.html
[ref-case_when]: https://dplyr.tidyverse.org/reference/case_when.html
[ref-between]: https://dplyr.tidyverse.org/reference/between.html
[concept-nothingness]: https://exercism.org/tracks/r/concepts/nothingness
[concept-strings]: https://exercism.org/tracks/r/concepts/strings
[concept-regex]: https://exercism.org/tracks/r/concepts/regular-expressions
