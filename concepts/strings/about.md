# About

## Introduction

A string is a piece of text between quotes.

```R
mystring <- "some text"
mystring
#> [1] "some text"
typeof(mystring)
#> [1] "character"
```

Unfortunately, the terminology may be confusing to programmers familiar with other languages.

Although the `type` is `character`, R makes no distinction between a single letter (called `char` in several other languages, but not in R) and a long string.
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
```

In the above example, `length(s[1])` is equivalent to `length("some")`: the number of _vector elements_, not the _string length_.

Manipulating an individual string is obviously possible, but needs particular functions that will be discussed below.

### Escaping

As we saw above, some punctuation characters need to be "escaped" by being preceeded with backslash `\`.

The list will be no surprise to most experienced programmers, as this topic is fairly well standardized across languages.

As well as quotes (as shown above), the list includes newlines `\n`, tabs `\t`, backslash `\\`, and Unicode symbols beginning with `\U` or `\u`.

To avoid using lots of escape characters, it is possible to define raw strings within `r"( )"`:

```R
r"(raw "string")"
#> [1] "raw \"string\""
```

For raw strings containing parentheses `( )`, there are many other [syntax options][book-raw].

### Locales

Any currently-supported version of R encodes strings in UTF-8, so most world languages can be supported.

```R
"आधुनिक मानक हिन्दी"
#> [1] "आधुनिक मानक हिन्दी"
```

Additionally, many R functions are aware of [`locale`][wiki-locale], and try to follow local conventions for string sorting, conversion to upper/lower case, dates and times, etc.

This syllabus will show examples mainly for US English: both because this is a common default, and because the syllabus authors happen to be US-resident.

Locales are a complex topic, so please search for documentation on your own situation.


## String functions

Most things are possible in base R, but many programmers find support for string manipulation rather limited and confusing.

Fortunately, there are `tidyverse` packages that are much more intuitive, flexible and self-consistent.

### Base R

There is still a lot of legacy code using old-style string functions.
This includes most community solutions on Exercism.

Additionally, for small tasks it can be useful to use built-in functions instead of importing a large library.
The R track maintainers tend to take this approach when writing exemplar solutions to validate the exercises on our [GitHub repo][gh-exercism-r].

Therefore, some knowledge of the old approaches is still worth learning.

The functions below are presented in their simplest form, but most also have optional arguments.
See the documentation for details.

#### [`nchar`][ref-nchar]

Returns the number of characters in a string.

```R
nchar("string")
#> [1] 6

nchar("Hrōðgār") # a person in Beowulf, written in Old English
#> [1] 7
```

The (_complicated!_) topic of what "character" means is beyond our scope.
Just note a couple of points in the examples above:

- Though implemented in C internally, strings in R are not `\0`-terminated (which would add 1 to the result).
- Multi-byte Unicode characters are handled as you might expect/hope. "Hrōðgār" has 7 characters (also called "runes" or "code points"), but needs 10 bytes for storage.

Be careful what you pass to `nchar`.
Results can still be unpredictable for non-`character` values, though this has improved in recent R versions.

#### [`grep`][ref-grep]

Searches for a pattern in a vector of strings, returning indices with a match.

```R
grep("Jav", c("Java", "Python", "Javascript"))
#> [1] 1 3
```

#### [`paste`][ref-paste] and [`paste0`][ref-paste]

Combines an arbitrary number of strings into a single string.

Optionally, a separator can be specified for `paste`: the default is a space.

`paste0(v)` is equivalent to `paste(v, sep = "")`.

```R
paste("bits", "of", "a", "string")
#> [1] "bits of a string"
paste0("bits", "of", "a", "string")
#> [1] "bitsofastring"
```

#### [`sprintf`][ref-sprintf]

For finer control over string assembly, R copies the `sprintf` function from C (and several later languages: Wikipedia [lists][wiki-printf-ports] about 30).

```R
r <- 5.3
pi <- 3.14159
sprintf("A circle of radius %.1f has area %.2f", r, pi * r^2)
#> [1] "A circle of radius 5.3 has area 88.25"
```

#### [`trimws][ref-trimws]

Leading and/or trailing whitespace can be removed with `trimws()`:

```R
> s <- "    messy string   "
> trimws(s)
[1] "messy string"
```

There is a `which = "left"` (or "right") parameter to avoid trimming both ends.

#### [`substr`][ref-substr]

Operates on a single string and returns a substring between two (inclusive) limits.

```R
substr("Exercism", 5, 7)
#> [1] "cis"
```

#### [`strsplit`][ref-strsplit]

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
If you have not already reached that part of the syllabus, just know for now that [`unlist()`][ref-unlist] function wiil (in this case) convert a list to a vector.

```R
unlist(strsplit("Exercism", ""))
#> [1] "E" "x" "e" "r" "c" "i" "s" "m"
```

#### [`regexpr`][ref-grep] and [`regexpr`][ref-grep]

Short for "regular expression", these functions search for occurrences of a pattern in a string, returning a list of (potentially) useful data.
This is mentioned only for completeness: _there are better options!_

`regexpr` returns only the first occurrence, `gregexpr` returns all occurrences ("g" for "global" search).

As the names imply, the pattern can be a [regex][wiki-regex], which will be covered in a [later Concept][concept-regex].
For now, we can just work with string literals as the simplest pattern.

```R
regexpr("scr", "Javascript, Typescript")
#> [1] 5
attr(,"match.length")
#> [1] 3
attr(,"index.type")
#> [1] "chars"
attr(,"useBytes")
#> [1] TRUE

gregexpr("scr", "Javascript, Typescript")
[[1]]
#> [1]  5 17
attr(,"match.length")
#> [1] 3 3
attr(,"index.type")
#> [1] "chars"
attr(,"useBytes")
#> [1] TRUE
```

~~~~exercism/advanced
Why do these old string functions look like Unix shell commands?

Though R was created in 1993, it was designed to be largely backwards-compatible with the S language.

S was designed at Bell Labs, first appearing in 1976.
Bell Labs were also responsible for Unix (from 1969) and the C language (1972).

Quite a team from that much earlier era!
We can only assume that they talked to one another and exchanged ideas.
~~~~

### Tidyverse

Being charitable, we could say that the old-style string functions are not the best that R has to offer (_less charitable views are available_).

To improve the situation, the [`stringr`][ref-stringr] library has been in development since 2009, and is now a key part of the [Tidyverse][ref-tidyverse] collection.

Import it into your namespace with `library(stringr)` or `library(tidyverse)`.

Some key features include:

- All function names have a `str_` prefix and try to make the purpose clear.
- The order of arguments tries to be self-consistent, with input data as the first argument.
- Inputs can range from a single string to complex data structures. Functions will try to adapt and do the most sensible thing.

Like all the Tidyverse packages, `stringr` has good documentation, typically written by the package author(s).

- A [reference website][ref-stringr]
- A [cheatsheet][cheat-stringr]
- A [chapter][book-strings] in "R for Data Science".

There are dozens of functions available in `stringr`, and they often have a variety of optional arguments.
This can be a bit overwhelming at first, so the documentation is your friend.

Think about what you want to put in (single string? vector? something more complex?), and what you want to get out.

There is probably an easy way to do whatever you want, if you can find the correct function and the correct arguments.

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

[`str_length`][ref-str_length] counts code points (similar to `nchars`).

Various other functions manipulate whitespace, including [`str_trim()`][ref-str_trim] and [`str_squish()`][ref-str_trim].
This is often a vital cleaning task at the start of any data science project.

```R
str_length(c("R", "Python", "Julia"))           #> [1] 1 6 5

str_pad(c("R", "Python", "Julia"), 8, "right")  # add spaces if necessary
#> [1] "R       " "Python  " "Julia   "
str_trim("R       Python  Julia   ")   # remove leading & trailing whitespace
#> [1] "R       Python  Julia" 
str_squish("R       Python  Julia   ")  # trim, collapse multiple spaces    
#> [1] "R Python Julia"
```

#### Subset strings

The function [`str_sub(string, start, end)`][ref-str_sub] will return the substring from `start` to `end` (inclusive), while [`str_sub_all()`][ref-str_sub] can operate on multiple strings.

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

# str_sub_all takes vector input, gives list output
str_sub_all(c(s, "ijklmnop"), c(1, 4, 6), c(2, 5, -1))
[[1]]
#> [1] "ab"  "de"  "fgh"

[[2]]
#> [1] "ij"  "lm"  "nop"
```

#### Join strings

[`str_flatten`][ref-str_flatten] converts a character vector to a single string.
The `collapse` argument is inserted between each element and defaults to `""`.

```R
c("R", "Julia", "Python") |> str_flatten()
#> [1] "RJuliaPython"
c("R", "Julia", "Python") |> str_flatten(collapse = " - ")
#> [1] "R - Julia - Python"
```

[`str_c`][ref-str_c] converts multiple character vectors to a single character vector, with recyling as necessary.

```R
str_c(LETTERS[1:8], 1:8, sep = ":")
#> [1] "A:1" "B:2" "C:3" "D:4" "E:5" "F:6" "G:7" "H:8"
```

[`str_glue`][ref-str_glue] brings simple string interpolation to R.
Expressions inside braces `{ }` are interpreted and the text repesentation substituted.

If multiple expressions strings are supplied, they will also be joined as in `str_flatten`.
Strings can also be optionally trimmed of leading/trailing whitespace.

```R
r <- 5.3
pi <- 3.14159
str_glue("A circle of radius {r} has area {pi * r^2}")
A circle of radius 5.3 has area 88.2472631
```

Though `str_glue` is flexible (and quite complicated), an even wider range of possibilities is available in the underlying [`glue`][ref-glue] library.

#### Split strings

A very common use of R is to massage messy data into a consistent format for analysis.
To help this, there are several ways to split text into substrings.

[`str_split_1`][ref-str_split] is the simplest, converting a single string into a vector of pieces, split at some specified pattern (there is no default pattern).

```R
s <- "R Julia Python"
str_split_1(s, " ")
#> [1] "R"      "Julia"  "Python"
```

[`str_split_i`][ref-str_split] takes a character vector and an index `n`, returning a vector of the `n`th substring of each input string.

```R
s2 <- c(s, "C Kotlin, F#")  #> [1] "R Julia Python" "C Kotlin, F#"
str_split_i(s2, " ", 2)  # 2nd element of each
#> [1] "Julia"   "Kotlin,"
```

[`str_split`][ref-str_split] takes a character vector, returning a list of vectors.
There is a [Lists Concept][concept-lists] in our syllabus, which explains the output.

```R
str_split(s2, " ")
[[1]]
#> [1] "R"      "Julia"  "Python"

[[2]]
#> [1] "C"       "Kotlin," "F#"     
```

There is also [`str_split_fixed`][ref-str_split], which returns a matrix.
Matrices will be covered in a later Concept.

#### Match strings

To match the whole string, [`str_equal()`][ref-str_equal] can use various definitions of "equality".
Most simply, the default is case sensitive but can be changed.
Locales and [Unicode][wiki-unicode] create many more possibilities.

```R
str_equal("Odin", "odin")
#> [1] FALSE
str_equal("Odin", "odin", ignore_case = TRUE)
#> [1] TRUE
```

There are many [other functions][ref-string-matching], which will be discussed in more detail in the [Regular Expressions Concept][concept-regex].

#### Mutate strings

Some languages (mainly European) distinguish between UPPERCASE and lowercase letters.
There are a set of `stringr` [functions][ref-str-case] to interconvert these, in locale-appropriate ways:

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

For substring replacement based on pattern matching, [`str_replace()`][ref-str_replace] changes the first occurrence of the pattern, [`str_replace_all()`][ref-str_replace] changes all occurrences.

For substring replacement based on character indexing, there is an assignment form of [str_sub()][ref-str_sub].

```R
 s <- "abcde"
str_sub(s, 3, 4) <- "yz"
s
#> [1] "abyze"
```

#### Miscellaneous

[`str_dup`][ref-str_dup] creates duplicates and [`str_unique`][ref-str_unique] removes duplicates.

By default `str_dup` has no separator, but one can be specified.

```R
str_dup("xyz", 4, sep = ", ")
#> [1] "xyz, xyz, xyz, xyz"
```

`str_unique` is an extension of [`unique()`][ref-unique].
Both remove duplicate entries from a vector, but the `stringr` function can also handle case sensitivity and various locale-specific matches.

```R
inp <- c("some", "strings", "Some", "Strings")
str_unique(inp)
#> [1] "some"    "strings" "Some"    "Strings"
str_unique(inp, ignore_case = TRUE)
#> [1] "some"    "strings"
```

~~~~exercism/advanced
The `stringr` library is based on the [`stringi`][ref-stringi] library of lower-level functions.

If you have specific needs not already discussed above, then:

1. Check the [`stringr`][ref-stringr] documentation, which covers more options than we can mention in even this long Concept document.
2. Check the [`stringi`][ref-stringi] documentation, which describes lots more functionality.

[ref-stringr]: https://stringr.tidyverse.org/reference/index.html
[ref-stringi]: https://stringi.gagolewski.com/
~~~~

[ref-nchar]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/nchar
[ref-grep]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/grep
[ref-paste]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/paste
[ref-sprintf]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sprintf
[ref-trimws]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/trimws
[ref-substr]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/substr
[ref-strsplit]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/strsplit
[ref-unlist]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unlist
[ref-stringr]: https://stringr.tidyverse.org/index.html
[ref-tidyverse]: https://tidyverse.org/
[ref-str_length]: https://stringr.tidyverse.org/reference/str_length.html
[ref-str_sub]: https://stringr.tidyverse.org/reference/str_sub.html
[ref-str_flatten]: https://stringr.tidyverse.org/reference/str_flatten.html
[ref-str_c]: https://stringr.tidyverse.org/reference/str_c.html
[ref-str_glue]: https://stringr.tidyverse.org/reference/str_glue.html
[ref-glue]: https://glue.tidyverse.org/reference/glue.html
[ref-str_split]: https://stringr.tidyverse.org/reference/str_split.html
[ref-str_equal]: https://stringr.tidyverse.org/reference/str_equal.html
[ref-string-matching]: https://stringr.tidyverse.org/reference/index.html#string
[ref-str-case]: https://stringr.tidyverse.org/reference/case.html
[ref-str_replace]: https://stringr.tidyverse.org/reference/str_replace.html
[ref-str_dup]: https://stringr.tidyverse.org/reference/str_dup.html
[ref-str_unique]: https://stringr.tidyverse.org/reference/str_unique.html
[ref-unique]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unique
[ref-str_trim]: https://stringr.tidyverse.org/reference/str_trim.html
[cheat-stringr]: https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
[book-strings]: https://r4ds.hadley.nz/strings.html
[book-raw]: https://r4ds.hadley.nz/strings.html#sec-raw-strings
[wiki-printf-ports]: https://en.wikipedia.org/wiki/Printf
[wiki-locale]: https://en.wikipedia.org/wiki/Locale_(computer_software)
[wiki-regex]: https://en.wikipedia.org/wiki/Regular_expression
[wiki-unicode]: https://en.wikipedia.org/wiki/Unicode
[gh-exercism-r]: https://github.com/exercism/r
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[concept-regex]: https://exercism.org/tracks/r/concepts/regular-expressions
