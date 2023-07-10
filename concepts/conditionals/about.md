# About

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

There is no infix operator for exclusive or (i.e. A OR B, but not both). The `xor()` function can be used in this case.

## Branching

The basic form of an if-then-else is 

```R
if (x > 10) {
    y <- "big"
} else if (x > 2) {
    y <- "medium"
} else {
    y <- "tiny"
}
```

In this case, both parentheses `()` around the boolean and braces `{}` around the statement are required. 
A simple `if` statement can be shortened:

```R
if (x == 0) return("success")
```

## Using vectors in conditionals

Looking ahead to the `vector-filtering` concept: the conditional clause in parentheses `()` must evaluate to a single `TRUE`/`FALSE`. 
Including vectors in the comparison usually gives a vector of booleans, so these will need to be wrapped in an aggregating function such as `all()` or `any()`.

```R
> numbers <- c(4,5,7,9,10,11)
> numbers %% 3 == 0 # gives vector of booleans
[1] FALSE FALSE FALSE  TRUE FALSE FALSE

# use any() to get a single TRUE/FALSE
> if (any(numbers %% 3 == 0)) print("1 or more numbers are divisible by 3")
[1] "1 or more numbers are divisible by 3"
```

## The `ifelse` function

An alternative if-else form may be useful, provided there is only a true/false outcome.

```R
y = ifelse(x > 8, "big", "small")

# Don't do this:
z = ifelse(x > 100, 100, "small") # can lead to problems
```

`ifelse()` takes exactly three parameters: boolean clause, value if `TRUE`, value if `FALSE`.

Vector inputs are acceptable, and then a vector output is produced. 
In this case, ensure both branches result in the same type (`mode`) of data: numeric, character, boolean, etc.
This will be covered in the `vector-functions` concept. 
