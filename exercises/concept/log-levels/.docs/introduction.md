# Introduction

## Background

A string is a piece of text between quotes.

```R
mystring <- "some text"
mystring
#> [1] "some text"
typeof(mystring)
#> [1] "character"
```

Unfortunately, the terminology may be confusing to programmers familiar with other languages.

Although the `type` is `character`, R makes no distinction between a single letter (called `char` in several other languages, but _not_ in R) and a long string.
Both are a single item, and can be in single `' '` or double `" "` quotes interchangeably.

The style guide recommends using double quotes, except when you want to use double quotes within the string without escaping them.

```R
str2 <- 'String with "quotes"'  # convenience format
str2
#> [1] "String with \"quotes\""    # standard format
```

A `character vector` is thus a vector of strings, with each string as a single element.

```R
s <- c("some", "strings")
s
#> [1] "some"    "strings"
length(s)
#> [1] 2
length(s[1])  # the number of vector elements, not the string length
#> [1] 1

nchar(s[1])  # the number of characters in the string "some"
#> [1] 4
```

In the above example, `length(s[1])` is equivalent to `length("some")`: the number of _vector elements_, not the _string length_.

Manipulating an individual string is obviously possible, as with `nchar()` in the above example, but needs particular functions that will be discussed below.

### Locales

Any currently-supported version of R encodes strings in UTF-8, so most world languages can be supported.

```R
"आधुनिक मानक हिन्दी"
#> [1] "आधुनिक मानक हिन्दी"
```

Additionally, many R functions are aware of `locale`, and try to follow local conventions for string sorting, conversion to upper/lower case, dates and times, etc.

## String functions

Most things are _possible_ in base R, but many programmers find support for string manipulation rather limited and confusing.

Fortunately, there are `tidyverse` packages that are much more intuitive, flexible and self-consistent.

### Base R

There is still a lot of legacy code using old-style string functions.
This includes most community solutions on Exercism.

Additionally, for small tasks it can be useful to use built-in functions instead of importing a large library.
The R track maintainers tend to take this approach when writing exemplar solutions to validate the exercises.

Therefore, some knowledge of the old approaches is still worth learning.

#### `nchar`

Returns the number of characters in a string.

```R
nchar("string")
#> [1] 6

nchar("Hrōðgār") # a person in Beowulf, written in Old English
#> [1] 7
```

The (_complicated!_) topic of what "character" means is beyond our scope.
Just note a couple of points in the examples above:

- Though implemented in C internally, strings in R are not `\0`-terminated (which would add 1 to the length).
- Multi-byte Unicode characters are handled as you might expect/hope. "Hrōðgār" has 7 characters (also called "runes" or "code points"), but needs 10 bytes for storage.

#### `paste` and `paste0`

Combines an arbitrary number of strings into a single string.

Optionally, a separator can be specified for `paste`: the default is a space.

`paste0(v)` is equivalent to `paste(v, sep = "")`.

```R
paste("bits", "of", "a", "string")
#> [1] "bits of a string"
paste0("bits", "of", "a", "string")
#> [1] "bitsofastring"
```

#### `sprintf`

For finer control over string assembly, R copies the `sprintf` function from C (and several later languages: Wikipedia [lists][wiki-printf-ports] about 30).

```R
r <- 5.3
pi <- 3.14159
sprintf("A circle of radius %.1f has area %.2f", r, pi * r^2)
#> [1] "A circle of radius 5.3 has area 88.25"
```

#### `trimws`

Leading and/or trailing whitespace can be removed with `trimws()`:

```R
s <- "    messy string   "
trimws(s)
#> [1] "messy string"
```

There is a `which = "left"` (or "right") parameter to avoid trimming both ends.

#### `substr`

Operates on a single string and returns a substring between two (inclusive) limits.

```R
substr("Exercism", 5, 7)
#> [1] "cis"
```

#### `strsplit`

Splits a string into an R list, based on a separator string.
The separator is required (with no default), but can be an empty string.

```R
strsplit("R, Python, Julia", ", ")
[[1]]
#> [1] "R"      "Python" "Julia" 

strsplit("Exercism", "")
[[1]]
#> [1] "E" "x" "e" "r" "c" "i" "s" "m"
```

Lists will be covered in a separate [Concept][concept-lists].
If you have not already reached that part of the syllabus, just know for now that `unlist()` function will (in this case) convert a list to a vector.

```R
unlist(strsplit("Exercism", ""))
#> [1] "E" "x" "e" "r" "c" "i" "s" "m"
```

### Tidyverse

Being charitable, we could say that the old-style string functions are not the best that R has to offer (_less charitable views are available_).

To improve the situation, the `stringr` library has been in development since 2009, and is now a key part of the Tidyverse collection.

Import it into your namespace with `library(stringr)` or `library(tidyverse)`.

Some key features include:

- All function names have a `str_` prefix and try to make the purpose clear.
- The order of arguments tries to be self-consistent, with input data as the first argument.
- Inputs can range from a single string to complex data structures. Functions will try to adapt and do the most sensible thing.

Like all the Tidyverse packages, `stringr` has good documentation, typically written by the package author(s).

- A [reference website][ref-stringr]
- A [cheatsheet][cheat-stringr]
- A [chapter][book-strings] in "R for Data Science".

#### Diversion: A quick primer on pipes

The use of pipes `|>` to connect functions will be discussed in more detail in other parts of the syllabus.

For now, it is useful to know that:

- A result from the left of the pipe becomes the first argument in the function to the right (where "right" ignores optional line breaks).
- Any remaining arguments can be included in the function call.
- In R, we must pipe to a function _call_, not just a _name_, so parentheses are always required (_this differs from some other languages_).

The example below illustrates the syntax.
Individual functions will be discussed later.

```R
library(stringr)

"Monday-25-February" |> 
  str_split("-") |>     
  unlist() |>               # [1] "Monday"   "25"       "February"
  str_sub(1, 3) |>          # [1] "Mon" "25"  "Feb"
  str_to_upper() |>         # [1] "MON" "25"  "FEB"
  str_flatten(collapse = ", ")
#> [1] "MON, 25, FEB"
```

#### Manage lengths

`str_length` counts code points (similar to `nchars`).

Various other functions manipulate whitespace, including `str_trim()` and `str_squish()`.
This is often a vital cleaning task at the start of any data science project.

```R
# The first 3 kernels in JuPyteR notebooks:
str_length(c("Julia", "Python", "R"))           #> [1] 1 6 5
#> [1] 5 6 1
str_pad(c("Julia", "Python", "R"), 8, "right")  # add spaces if necessary
#> [1] "Julia   " "Python  " "R       "

str_trim("Julia    Python    R    ")   # remove leading & trailing whitespace
#> [1] "Julia    Python    R"
str_squish("Julia   Python  R    ")  # trim, collapse multiple spaces 
#> [1] "Julia Python R"
```

#### Subset strings

The function `str_sub(string, start, end)` will return the substring from `start` to `end` (inclusive), while `str_sub_all()` can operate on multiple strings.

There is a lot of flexibility.
`start` and `end` default to the first and last character, respectively.
They  can be vectors of indices.
In welcome contrast to vector indexing, negative values count back from the string end, Python-style.

```R
s <- "abcdefgh"
str_sub(s, 2, 4)
#> [1] "bcd"
str_sub(s, 5)
#> [1] "efgh"
str_sub(s, -3, -2)
#> [1] "fg"
str_sub(s, c(1, 4), c(2, 5))
#> [1] "ab" "de"
str_sub(s, c(1, 4, 6), c(2, 5, -1))
#> [1] "ab"  "de"  "fgh"

s |> str_sub(2, 4) # these functions are designed for pipes
#> [1] "bcd"
```

#### Join strings

`str_flatten` converts a character vector to a single string.
The `collapse` argument is inserted between each element and defaults to `""`.

```R
c("R", "Julia", "Python") |> str_flatten()
#> [1] "RJuliaPython"
c("R", "Julia", "Python") |> str_flatten(collapse = " - ")
#> [1] "R - Julia - Python"
```

`str_c` converts multiple character vectors to a single character vector, with recyling as necessary.

```R
str_c(LETTERS[1:8], 1:8, sep = ":")
#> [1] "A:1" "B:2" "C:3" "D:4" "E:5" "F:6" "G:7" "H:8"
```

`str_glue` brings simple string interpolation to R.
Expressions inside braces `{ }` are interpreted and the text repesentation substituted.

```R
r <- 5.3
pi <- 3.14159
str_glue("A circle of radius {r} has area {pi * r^2}")
A circle of radius 5.3 has area 88.2472631
```

#### Split strings

A very common use of R is to massage messy data into a consistent format for analysis.
To help this, there are several ways to split text into substrings.
Most are beyond the current scope.

`str_split_1` is the simplest, converting a single string into a vector of pieces, split at some specified pattern (there is no default pattern).

```R
s <- "R Julia Python"
str_split_1(s, " ")
#> [1] "R"      "Julia"  "Python"
```

#### Mutate strings

Some languages (mainly European) distinguish between UPPERCASE and lowercase letters.
There are a set of `stringr` functions to interconvert these, in locale-appropriate ways:

- `str_to_lower()`
- `str_to_upper()`
- `str_to_title()` : first letter of each word to upper
- `str_to_sentence()` : first letter of sentence to upper

```R
str_to_upper("elixir")    # defaults to locale = "en"
#> [1] "ELIXIR"
str_to_upper("ελληνικά")  # infers Greek
#> [1] "ΕΛΛΗΝΙΚΆ"

str_to_title("the cat sat on the mat")
#> [1] "The Cat Sat On The Mat"
str_to_sentence("the cat sat on the mat")
#> [1] "The cat sat on the mat"
```

For substring replacement based on pattern matching, `str_replace()` changes the first occurrence of the pattern, `str_replace_all()` changes all occurrences.

For substring replacement based on character indexing, there is an assignment form of str_sub().

```R
 s <- "abcde"
str_sub(s, 3, 4) <- "yz"
s
#> [1] "abyze"
```

[ref-stringr]: https://stringr.tidyverse.org/index.html
[ref-tidyverse]: https://tidyverse.org/
[cheat-stringr]: https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
[book-strings]: https://r4ds.hadley.nz/strings.html
[wiki-printf-ports]: https://en.wikipedia.org/wiki/Printf
[wiki-locale]: https://en.wikipedia.org/wiki/Locale_(computer_software)
[wiki-regex]: https://en.wikipedia.org/wiki/Regular_expression
[wiki-unicode]: https://en.wikipedia.org/wiki/Unicode
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[concept-regex]: https://exercism.org/tracks/r/concepts/regular-expressions
