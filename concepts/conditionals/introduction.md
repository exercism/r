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

An alternative if-else form may be useful:

```R
y <- ifelse(x > 8, "big", "small")
```

`ifelse()` takes exactly three parameters: boolean clause, value if `TRUE`, value if `FALSE`.
