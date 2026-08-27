# Introduction

Regular expressions are a highly versatile way to _pattern match_ strings, using a Domain Specific Language (DSL) designed for the purpose.

Many regex capabilities are built into Base R, and you may see examples in older code.

For new code, it is _strongly_ recommended to use the [`stringr`][web-stringr] library.

As noted in the [Strings Concept][concept-strings], `stringr` has good documentation, typically written by the package author(s).

- A [reference website][web-stringr]
- A [cheatsheet][cheat-stringr].
- A [strings chapter][book-strings] and a [regex chapter][book-regex] in "R for Data Science".

~~~~exercism/note
This R syllabus assumes that you are already familiar with basic regex syntax.
We will concentrate solely on R-specific features.

Some resources to refresh your regular expression knowledge are listed below.

- [Regex101][regex101]
- [RegExr][regexr]
- [RexEgg][rexegg]
- [RegexOne][regexone]
- [Regular Expressions Info][regex-info]

[regex101]: https://regex101.com/
[regexr]: https://regexr.com/
[regex-info]: https://www.regular-expressions.info/
[rexegg]: https://www.rexegg.com/
[regexone]: https://regexone.com/
~~~~

Many of the functions already discussed in the [`Strings`][concept-strings] Concept are designed for regex searches as standard.

We kept the Strings Concept relatively simple by only matching on string literals, but any regex pattern can be used instead.

Formally, a regex is created in R by calling [`regex()`][ref-regex].
For convenience, `stringr` functions will treat any pattern string as a regex.
In the example below the first `str_replace_all()` is syntactic sugar for the second version:

```R
input <- "Some input string"

# "\\s" matches any whitespace character
input |> str_replace_all("\\s", "_")
[1] "Some_input_string"

input |> str_replace_all(regex("\\s"), "_")
[1] "Some_input_string"
```

The [cheatsheet][cheat-stringr] is a useful guide: all functions with a `pattern` argument (printed in red) accept a regex, and page 2 summarizes regex syntax.

Note that the [`regex()`][ref-regex] function can still be important if you need to override the defaults, such as case sensitivity or locale.

```R
# default is case sensitive
"A Mixed Assortment" |> 
    str_replace_all(regex("[aeiou]", ignore_case = TRUE), "*")
#> [1] "* M*x*d *ss*rtm*nt"
```

Many regex codes include a backslash, such as the `\s` used above.
In normal R strings, `\` needs to be escaped by doubling, hence `"\\s"`.

Backslashes can proliferate and become confusing, so it may help to use [raw strings][book-raw] in complex cases.

By default, the syntax to define a raw string is `r"( )"`, but other delimiters are allowed.
As parentheses `( )` and brackets `[ ]` are both commmon in regex syntax (for capture groups and option groups), braces `{ }` might be a good choice.

```R
input |> str_replace_all(r"{\s\w}", "__")
#> [1] "Some__nput__tring"
```

## Detecting matches

Here are some questions, and functions that can help answer them.

Some examples use `fruit`, a vector of 80 fruit names included with `stringr` for practicing.

_Does a string contain a match?_
`str_detect()`, or `str_starts()`, `str_ends()` to avoid using the `^` or `$` anchors.

```R
# berries begining with b
fruit |> str_detect("^b.*berry") |> head(15)
#> [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE

# alternative syntax
fruit |> str_starts("b.*berry") |> head(15)
#> [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE
```

_Return only strings containing a match?_
Use `str_subset()` to get the strings, `str_which()` to get the indices.

```R
fruit |> str_subset("a...e")
[1] "apple"       "blackberry"  "mandarine"   "nectarine"   "pineapple"   "pomegranate" "raspberry"   "salal berry"
> fruit |> str_which("a...e")
[1]  1  7 48 51 62 64 70 73
```

_How many matches in each string?_
Use `str_count()`.

```R
# count vowels
fruit |> str_count("[aeiou]") |> head(10)
#> [1] 2 3 4 3 3 2 2 3 5 3
```

_Where is the match?_
`str_view()` for interactive use, `str_locate()` or `str_locate_all()` more generally.

```R
# str_view only shows matching elements, with match in < > delimiters
fruit |> str_view("a...e")
 [1] │ <apple>
 [7] │ bl<ackbe>rry
[48] │ mand<arine>
[51] │ nect<arine>
[62] │ pine<apple>
[64] │ pomegr<anate>
[70] │ r<aspbe>rry
[73] │ sal<al be>rry

# str_locate returns all elements
fruit |> str_locate("a...e") |> head(10)
      start end
 [1,]     1   5
 [2,]    NA  NA
 [3,]    NA  NA
 [4,]    NA  NA
 [5,]    NA  NA
 [6,]    NA  NA
 [7,]     3   7
 [8,]    NA  NA
 [9,]    NA  NA
[10,]    NA  NA
```

## Captures

Commonly, we want to know _what_ matches. 
This is achieved by including capture groups in parentheses within the regex.

It is possible to refer back to captures within the same regex, using `\1`, `\2`, etc.
For example, finding repeated pairs of letters:

```R
fruit |> str_subset("(..)\\1")
[1] "banana"      "coconut"     "cucumber"    "jujube"      "papaya"      "salal berry"
```

With similar syntax, captures can be used in replacement strings:

```R
# double to triple
fruit |> 
  str_subset("(..)\\1") |> 
  str_replace("(..)\\1", "\\1\\1\\1")
[1] "bananana"      "cococonut"     "cucucumber"    "jujujube"      "papapaya"      "salalal berry"
```

Gather matches for later processing using the `str_match()` function for just the first match, or `str_match_all()` for all matches.

Capture groups tend to produce complicated output in any language.
The R approach (_which is also vectorized as an added challenge_) is to generate a matrix from `str_match()`, with one row per input string, column 1 containing the full matched string, remaining columns containing the various capture groups.

Using named groups can be an advantage, as they become column names in the results matrix.

```R
recipe <- "dissolve 25g sugar in 200ml water"
recipe |> str_match("(\\d+g) .* (\\d+ml)")
     [,1]                 [,2]  [,3]   
[1,] "25g sugar in 200ml" "25g" "200ml"

# use named capture groups
recipe |> str_match("(?<wt>\\d+g) .* (?<vol>\\d+ml)")
                          wt    vol    
[1,] "25g sugar in 200ml" "25g" "200ml"
```

We have not said much about matrices in this syllabus, though there is a [concept document][concept-matrices-arrays] you can access.
Matrices do not fit well with the Tidyverse ecosystem, despite being part of Base R for a long time.

In quick summary: treat matrices like vectors with 2 indices, in the order `[rows, cols]`.
Leave either index blank to get the whole row/column.

When getting a single row `r` with `m[r,]` or a single column `c` with `m[,c]`, the value returned is flattened to a vector by default.

```R
> amounts <- recipe |> str_match("(?<wt>\\d+g) .* (?<vol>\\d+ml)")

# get all of row 1, as a named vector
> amt1 <- amounts[1,]
> amt1
                                       wt                  vol 
"25g sugar in 200ml"                "25g"              "200ml" 

# get a vector element
amt1["wt"] |> unname()
[1] "25g"
```

Inevitably, `str_match_all()` produces output with even more structure:

- The result is a list, with one element per input string.
- If there is only one input string, unlist the output with `[[1]]` indexing as described in the [Lists Concept][concept-lists].
- Each element is a matrix, with columns as for `match()`.
- Each row in the matrix is a successful capture.

```R
mix <- "Mix 200g of sugar, 180g of flour and 150g of butter"

# raw output
> str_match_all(mix, "(\\d+)g")
[[1]]
     [,1]   [,2] 
[1,] "200g" "200"
[2,] "180g" "180"
[3,] "150g" "150"

# we just want the first list element
> str_match_all(mix, "(\\d+)g")[[1]]
     [,1]   [,2] 
[1,] "200g" "200"
[2,] "180g" "180"
[3,] "150g" "150"

# captures are in column 2, so get that as a vector
> str_match_all(mix, "(\\d+)g")[[1]][,2]
[1] "200" "180" "150"
```

Of course, matches can fail.
The result will then be the special value `NA`.
Be ready to test for this, as described in the [Nothingness Concept][concept-nothingness].

```R
# failed match
recipe |> str_match("(not here)")
     [,1] [,2]
[1,] NA   NA  
```

[concept-strings]: https://exercism.org/tracks/R/concepts/strings
[concept-matrices-arrays]: https://exercism.org/tracks/r/concepts/matrices-arrays
[concept-lists]: https://exercism.org/tracks/R/concepts/lists
[concept-nothingness]: https://exercism.org/tracks/R/concepts/nothingness
[web-stringr]: https://stringr.tidyverse.org/index.html
[ref-regex]: https://stringr.tidyverse.org/reference/modifiers.html
[cheat-stringr]: https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
[book-strings]: https://r4ds.hadley.nz/strings.html
[book-regex]: https://r4ds.hadley.nz/regexps.html
[book-raw]: https://r4ds.hadley.nz/strings.html#sec-raw-strings
