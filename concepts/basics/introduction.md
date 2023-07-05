# Introduction

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. The preferred assignment operator is `<-` 

```R
x <- 42
avogadro <- 6.02e23
mystr <- "Hello, World!"
```

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

Also, note that `#` starts a single-line comment.

## Functions

To define a function:

```R
squareit <- function(x) {
    x * x
}
```

R will automatically return the final value of a function. More generally, `return(x * x)` will work from anywhere in the function body.

Calling a function is conventional:

```R
y <- squareit(3) # y is now 9
```
