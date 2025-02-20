# Native Pipes

```r
reverse <- function(text) {
  strsplit(text, "")[[1]] |>
    rev() |>
    paste(collapse = "")
}
```

From R 4.1.0 (introduced May 2021), the base language has [native pipes][pipe-data-science], allowing a syntax more typical of functional languages such as F#. 

For code such as `a() |> b()`, the result of `a()` automatically becomes the first parameter of `b()`, so this is another way of writing `b(a())`.

Note that the pipe operator in R needs a _function call_ such as `rev()` on the right hand side, not a _function name_ such as `rev`.
We must include the parentheses.
This syntax contrasts with some other languages that use pipes, and is a fairly common source of confusion.

The underlying approach in the above code is the same as `split-reverse`.

Pipes could similarly be used for `UTF8-reverse`:

```r
reverse <- function(text) {
  utf8ToInt(text) |>
    rev() |>
    intToUtf8()
}
```

Pipes give a good balance of terseness and readability when chaining together a series of operations, so they have become very popular among R programmers.

Before R 4.1.0, the only way to use pipes was with the `%>%` operator from the `magrittr` library.
This is still available and has some [advanced features][base-vs-magrittr] not implemented in native pipes.
However, native pipes are significantly simpler, require no library import, and are now [preferred][pipe-data-science] for most purposes.


[base-vs-magrittr]: https://www.tidyverse.org/blog/2023/04/base-vs-magrittr-pipe/
[pipe-data-science]: https://r4ds.hadley.nz/data-transform.html#sec-the-pipe