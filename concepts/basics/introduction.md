# Introduction

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. The preferred assignment operator is `<-` 

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

The preferred assignment operator is `<-` (not `=`).
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

R will automatically return the final value of a function. More generally, `return(x * x)` will work from anywhere in the function body.

Calling a function is simple:

```R
y <- squareit(3) # y is now 9
```
