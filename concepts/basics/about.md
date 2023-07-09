# About

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. The default `mode` is `numeric`, usually implemented as a double-precision float. To force use of 32-bit integers use a `L` suffix:

```R
> class(50)
[1] "numeric"
> class(50L)
[1] "integer"
```

The preferred assignment operator is `<-` 

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

Using `=` instead will often but not always work. This is discouraged as poor style.

Operators work conventionally:
```R
2 + 3   # 5
2 - 3   # -1
2 * 3   # 6
2 / 3   # 0.6666667
8 %/% 3 # 2 (integer division)
8 %% 3  # 2 (remainder)
2 ^ 3   # 8 (exponential)
```

Also, note that `#` starts a single-line comment. There is no separate syntax for multiline comments.

## Functions

To define a function:

```R
squareit <- function(x) {
    x * x
}
```

Functions can have zero or more arguments, separated by commas.
Parentheses are needed with `function()` even if there are no parameters.

Default values can be specified for arguments, though these must come after any arguments without defaults.
As a rather pointless example:

```R
squareit <- function(x = 42) {
    x * x
}

> squareit()
[1] 1764
```

The braces `{ }` are not strictly required for single-line function bodies, but including them is considered good style.

R will automatically return the final value of a function, as in the examples above.

`return()` can be used anywhere within the function body to make a return value explicit, but will return the specified value immediately and terminate the function without executing any of the remaining expressions in the function body. 

So an explicit call to `return()` is usually only really required if one wants to exit the function early and return a specific value for some reason. 
An example might be within an [`if-else` clause](/tracks/R/concepts/conditionals).

Some developers do prefer explicit returns as a matter of code style though.

Calling a function is conventional:

```R
> squareit(3)
[1] 9
```
