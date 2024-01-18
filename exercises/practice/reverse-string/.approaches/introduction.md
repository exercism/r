# Introduction

There are a surprising variety of ways to approach this exercise.
We will start with simple approaches, considering some variations in syntax, then go on to look at vector operations and run-time performance.

## General considerations

Base R provides a reasonable set of string operations, but these have grown organically over time and can be a little inconsistent / hard to learn. Often string manipulation in base R will require the use of regular expressions and by contrast to other high-level languages like Python or Ruby some string manipulation can be a little harder to do in (base) R.

However, packages such as [{stringr}](https://stringr.tidyverse.org/) and the underlying [{stringi}](https://stringi.gagolewski.com/index.html) are easy to use, expressive and efficient for manipulating strings in a myriad of ways. In practice many developers will turn to libraries such as these for manipulating strings, especially when needing to do more complex string processing.

But to begin with, bearing in mind that vectors are right at the heart of R (more on that later), a natural approach to reverse a string is to convert the string to a vector of characters, reverse that, and then convert back to a string.

## Use split-reverse-paste

```r
reverse <- function(text) {
  splits <- strsplit(text, "")[[1]]
  reversed <- rev(splits)
  paste(reversed, collapse = "")
}
```

This is a relatively simple approach, that has worked since early versions of R.

The first example uses intermediate variables.
We could instead use nested function calls: more concise, perhaps less readable.

```r
reverse <- function(text) {
  paste(rev(strsplit(text, "")[[1]]), collapse = "")
}
```

See the [`split-reverse`][split-reverse] approach for further details.

From R 4.1.0 (introduced May 2021), the base language also has native pipes, allowing a syntax more typical of functional languages:

```r
reverse <- function(text) {
  strsplit(text, "")[[1]] |>
    rev() |>
    paste(collapse = "")
}
```

Pipes give a good balance of terseness and readability, so they have become very popular among R programmers.

See the [`native-pipes`][native-pipes] approach for further details.


The three examples so far all use essentially the same approach, first converting the input string to a vector of characters.

## Use UTF8 codes

```r
reverse <- function(text) {
  intToUtf8(rev(utf8ToInt(text)))
}
```

In this approach we go via an intermediate vector of character codes: UTF-8 in the general case, but for characters common in English these are the same as ASCII codes:

```r
> utf8ToInt("abc")
[1] 97 98 99
```

The same choice of intermediate variables vs nested functions vs pipes is possible.

See the [`utf8-reverse`][utf8-reverse] approach for further details.

## Use `stri_reverse()`

```r
library(stringi)

reverse <- function(text) {
  stri_reverse(text)
}
```

This might be considered "cheating" for the Exercism exercise, but it is very commonly used in the context of a larger text-handling task.

The `stringi` library is regarded as especially strong in handling multiple locales and character sets.
Other popular string-handling libraries such as `stringr` tend to be built on top of `stringi`.

See the [`stri-reverse`][stri-reverse] approach for further details.

## Vector operations

The Exercism test suite only provides a single string in each test, expecting a single string to be returned.
This is compatible with other language tracks, but conflicts with R's emphasis on vector processing.

Suppose you want to do this:

```r
test_that("a vector", {
  text <- c("", "robot", "Ramen", "I'm hungry!", "racecar", "drawer")
  expected <- c("", "tobor", "nemaR", "!yrgnuh m'I", "racecar", "reward")
  expect_equal(reverse(text), expected)
})
```

In fact, this is perfectly normal in R.
However, of the examples shown so far, only `stri_reverse()` passes the vector test.

To generalize the other functions to handle vectors correctly, we need the `lapply` ("list apply") and `sapply` ("simplified apply") functions:

```r
reverse <- function(text) {
  strsplit(text, "") |>
    lapply(rev) |>
    sapply(paste, collapse = "")
}
```

See the [`vector-operations`][vector-operations] approach for further details.


## Performance

Full details will be given in a Performance article (to follow soon), with just a summary here.

Testing each of the approaches about 10,000 times with a single 5-character string gave the timing data below.

|expression         |minimum  |median   |itr/sec  |
|-------------------|--------:|--------:|--------:|
|strsplit_reverse   |  2.68 µs|  3.57 µs|   233505|
|nested_reverse     |  2.46 µs|  3.33 µs|   265805|
|pipes_reverse      |  2.42 µs|  2.60 µs|   360327|
|utf8_reverse       |  1.53 µs|  2.02 µs|   459766|
|utf8_pipe_reverse  |  1.52 µs|  1.65 µs|   543276|
|stri_reverse       |  0.43 µs|  0.44 µs|  1867283|
|vector_reverse     |  7.77 µs|  8.30 µs|    98551|

We can see that:
- Syntax makes essentially no difference, and variants with intermediate variables, nested functions or pipes all have similar runtimes.
- The UTF-8 approaches may be slightly faster than `strsplit`, but the `stri-reverse` library function is fastest by a significant margin.
- Vectorising the `strsplit` approach adds some overhead, making it somewhat slower for a single input.

For such a short input, all approaches are so fast that differences hardly matter.
For a better test, the same functions were run on a string about 24k characters long:

|expression       |minimum  |median   |itr/sec |
|-----------------|--------:|--------:|-------:|
|strsplit_reverse |  1.43 ms|  1.51 ms|     645|
|nested_reverse   |  1.41 ms|  1.48 ms|     671|
|pipes_reverse    |  1.41 ms|  1.47 ms|     679|
|utf8_reverse     |   183 µs|   189 µs|    5256|
|utf8_pipe_reverse|   184 µs|   189 µs|    5252|
|stri_reverse     |  37.4 µs|  37.8 µs|   26252|
|vector_reverse   |  1.41 ms|  1.48 ms|     676|

Differences are now much clearer, with `strsplit` approaches above a millisecond, UTF-8 approaches about 8x faster, and the library function >1000x faster.
The overhead from vectorizing has disappeared.

## Which approach to use?

The clearest message is that people who wrote `tidyverse` libraries such as `stringi` knew what they were doing.
The code is substantially faster than anything we wrote, and also versatile enough to handle vector input.

Using such libraries in the Exercism exercise may be "cheating", but it can be a very good idea in other contexts.

If we do need to write the code, designing it for vector operations is usually worthwhile.
There can be a small performance hit on small, single inputs, but rarely enough to worry about.

For more complex problems, vectorization can perform very much faster than using loops.
This is idiomatic R for a good reason.

[performance-article]: https://exercism.org/tracks/r/exercises/reverse-string/articles/performance
[split-reverse]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/split-reverse
[utf8-reverse]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/utf8-reverse
[stri-reverse]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/stri-reverse
[native-pipes]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/native-pipes
[vector-operations]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/vector-operations

