# About

## Variables and assignment

R is a [dynamically typed][wiki-dynamic] language, so in general it is not necessary to specify the type of a variable. The default type is [`numeric`][ref-numeric], usually implemented as a double-precision float. To force use of 32-bit integers use a `L` suffix (abbreviation for `Long`).

Getting the "type" of an obect is (for historical reasons) potentially confusing.
The functions [`typeof()`][ref-typeof] and [`class()`][ref-class] are similar, but may return slightly different results:

```R
typeof(50)
#> [1] "double"  # more specific: an implementation detail
typeof(50L)
##> [1] "integer"

class(50)
#> [1] "numeric"  # less specific: ignores implementation details
class(50L)
#> [1] "integer"
```

~~~exercism/advanced
You may also see references to `mode()`, which is similar to `typeof()`.

Please ignore `mode()` and `storage.mode()`.
They are only provided for backwards compatibility.
~~~~

The preferred assignment operator is `<-`.
If working in RStudio, it can be entered with the keyboard shortcut `Alt-minus`.

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

Using `=` instead of `<-` will often but not always work, and is discouraged as poor style.

Operators are mostly similar to many other languages, though `%%` and `%/%` are more unusual.
This `%` syntax is a way to call infix operators implemented as macros.

```R
2 + 3   # 5
2 - 3   # -1
2 * 3   # 6
2 / 3   # 0.6666667
8 %/% 3 # 2 (integer division)
8 %% 3  # 2 (remainder)
2 ^ 3   # 8 (exponential)
```

In R, `#` starts a single-line comment.
There is no separate syntax for multiline comments.

## Functions

To define a function:

```R
squareit <- function(x) {
    x * x
}
```

Functions can have zero or more arguments, separated by commas.
Parentheses `()` are needed with `function()`, even if there are no parameters.

Default values can be specified for function arguments, though these must come after any arguments without defaults.
As a rather pointless example:

```R
squareit <- function(x = 42) {
    x * x
}

squareit()
#> [1] 1764
```

The braces `{ }` are not strictly required for single-line function bodies, but including them is considered good style.

R will automatically return the final value of a function, as in the examples above.

`return()` can be used anywhere within the function body to make a return value explicit.
It will return the specified value immediately, and terminate the function without executing any of the remaining expressions in the function body.

An explicit call to `return()` is usually only required if one wants to exit the function early and return a specific value for some reason.
An example might be within an [`if-else` clause][concept-conditionals].

Some developers prefer explicit returns as a matter of code style though.

Calling a function is the same as in many other languages:

```R
squareit(3)
#> [1] 9
```

We will see in future Concepts that the result `9` is actually a length-1 vector rather than a scalar number.
Hence the inclusion of `[1]` to indicate that this is the beginning of the vector.

_Most things in R are some sort of vector!_

~~~~exercism/note
The R console would display the above example as:

```R
> squareit(3)
[1] 9
```

Documents in this syllabus mostly follow the convention used in several R textbooks, by removing the prompt and commenting the result.
This makes it easier to copy-paste code samples into the console and run them.
~~~~

[wiki-dynamic]: https://en.wikipedia.org/wiki/Dynamic_programming_language
[ref-numeric]: https://statsandr.com/blog/data-types-in-r/
[ref-typeof]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/typeof.html
[ref-class]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/class.html
[concept-conditionals]: /tracks/R/concepts/conditionals
