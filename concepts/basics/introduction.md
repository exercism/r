# Introduction

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. The preferred assignment operator is `<-` 

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

Using `=` instead of `<-` will often but not always work, and is discouraged as poor style.
If working in RStudio, it can be entered with the keyboard shortcut `Alt-minus`.

Operators are mostly conventional, but note `%/%` and `%%`:

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
There is no separate syntax for multi-line comments.

## Functions

To define a function:

```R
squareit <- function(x) {
    x * x
}
```

Functions can have zero or more arguments, separated by commas.
Parentheses `()` are needed with `function()`, even if there are no parameters.

Default values can be specified for function arguments, though these must come after any arguments without defaults, and use `=` not `<-` to assign the default value.
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

Calling a function is the same as in many other languages:

```R
squareit(3)
#> [1] 9
```
