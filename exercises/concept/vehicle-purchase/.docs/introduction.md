# Introduction

## Comparison operators

R has a set of operators that is the same as many other languages:

```R
1 == 2 # FALSE
1 != 2 # TRUE
1 < 2 # TRUE
1 > 2 # FALSE
1 <= 2 # TRUE
1 >= 2 # FALSE
```

## Branching

The basic form of an if-else is 

```R
if (x > 10) {
    y <- "big"
} else if (x > 2) {
    y <- "medium"
} else {
    y <- "tiny"
}
```

In this case, parentheses `()` around the boolean and braces `{}` around the statement are both required. 
A simple `if` statement can be shortened:

```R
if (x == 0) return("success")
```

## Comparison functions

There are a few useful functions that can take multiple arguments and compare them.

```R
> min(3, 1, 4) # minimum
[1] 1
> max(3, 1, 4) # maximum
[1] 4
```
