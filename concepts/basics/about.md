# About

## Variables and assignment

R is a dynamically typed language, so in general it is not necessary to specify the type of a variable. 
The default `mode` is `numeric`, usually implemented as a double-precision float. 
To force use of 32-bit integers use a `L` suffix:

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

Parentheses are needed with `function()` even if there are no parameters. The braces `{ }` are not strictly required here, but including them is considered good style.

R will automatically return the final value of a function. More generally, `return(x * x)` will work from anywhere in the function body.

Calling a function is conventional:

```R
y <- squareit(3) # y is now 9
```
