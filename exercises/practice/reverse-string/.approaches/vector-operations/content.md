# Vector Operations

```r
reverse <- function(text) {
  strsplit(text, "") |>
    lapply(rev) |>
    sapply(paste, collapse = "")
}
```

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
However, of the other approaches discussed, only `stri_reverse()` passes the vector test.

To generalize the other functions to handle vectors correctly, we need the [`lapply`][lapply] ("list apply") and `sapply` ("simplified apply") [functions][apply-functions], as in the code at the top of the page.

Programmers unused to these functions may find the code difficult to understand.
For clarity, we will break it down in stages, using intermediate variables that can be examined.

```r
> text <- c("abc", "def")
> chars <- strsplit(text, "")
> chars
[[1]]
[1] "a" "b" "c"

[[2]]
[1] "d" "e" "f"

> typeof(chars)
[1] "list"
```

The `strsplit()` function always returns a `list` of vectors.

For the [`split-reverse`][split-reverse] approach using single string inputs, we extracted the vector at index 1 by appending `[[1]]`.
THere is no need for that here: the `list` can be used directly by `lapply()`.

```r
> reversed <- lapply(chars, rev)
> reversed
[[1]]
[1] "c" "b" "a"

[[2]]
[1] "f" "e" "d"
```

The `lapply()` function always returns a `list`, which is next passed to `sapply()`:

```r
> result <- sapply(reversed, paste, collapse = "")
> result
[1] "cba" "fed"
> typeof(result)
[1] "character"
```

The `sapply()` function tries to simplify its output, rather than automatically returning a `list` like `lapply()`.
In this case, it produces a vector of character strings, which is what we need.

[split-reverse]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/split-reverse
[apply-functions]: https://ademos.people.uic.edu/Chapter4.html
[lapply]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/lapply.html
