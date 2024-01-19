# The `stri_reverse()`  function

```r
library(stringi)

reverse <- function(text) {
  stri_reverse(text)
}
```

This might be considered "cheating" for the Exercism exercise, but it is very commonly used in the context of a larger text-handling task.

The [`stringi`][stringi] library is regarded as especially strong in handling multiple locales and character sets.
Other popular string-handling libraries such as `stringr` tend to be built on top of `stringi`.

Code using [`stri_reverse()`][stri-reverse] is substantially faster than any of the other approaches, scales well to large inputs, and is also versatile enough to handle vectors.

Libraries from the `tidyverse` package, including `stringi`, are well designed and performant.
Their popularity also means they tend to be well documented, not least in [textbooks][r4ds-2e] and video courses.
Using them can be a very good idea in non-Exercism contexts.

[stringi]: https://stringi.gagolewski.com/
[stri-reverse]: https://www.rdocumentation.org/packages/stringi/versions/1.8.3/topics/stri_reverse
[r4ds-2e]: https://r4ds.hadley.nz/
