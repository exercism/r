# Use UTF8 codes

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

UTF-8 codes are just integers, which R is highly optimized to handle.
Using codes instead of characters makes little difference for very short strings, nut by avoiding some overhead it can be significantly faster for large amounts of text.

Details will be included in the [Performance article][performance].
In summary, reversing about 24k of text was about 10x faster with UTF-8 codes than characters.

## Syntax options

See [`split-reverse`][split-reverse] for a discussion of intermediate variables vs nested functions.

See [`native-pipes`][native-pipes] for a functional approach using pipes. 

The same choices are possible for `UTF8-reverse`, and pipes are probably preferred (in recent versions of R), representing a good balance of terseness and readability:

```r
reverse <- function(text) {
  utf8ToInt(text) |>
    rev() |>
    intToUtf8()
}
```

[split-reverse]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/split-reverse
[native-pipes]: https://exercism.org/tracks/r/exercises/reverse-string/approaches/native-pipes
[performance]: https://exercism.org/tracks/r/exercises/reverse-string/articles/performance
