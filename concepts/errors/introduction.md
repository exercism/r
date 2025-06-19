# Introduction

As explored in the `nothingness` concept, R has various ways to represent data which is absent (`NULL`), unknown (`NA`) or mathematically invalid (`NaN`, `Inf`).
In general, it will try to use these to flag problems in-place, and continue without raising an exception.

## `stop()`

Some problems are too fundamental to let the program continue. In this case, use `stop(msg)` to immediately halt the program with an `Error` and print `msg`.

```R
> f <- function() {
+     stop("I have a problem")
+ }
> f()
Error in f() : I have a problem
```

## `stopifnot()`

Similar to an `assert` in other languages, this is a convenient wrapper for `stop()`. 
The parameters are an arbitrary number of boolean conditions, and the program will only continue if they are all `TRUE`.

```R
> stopifnot(1 < 2) # continues OK
> stopifnot(1 < 2, 1 == 2)
Error: 1 == 2 is not TRUE
```

## `try()`

R has a sophisticated variety of ways to handle errors.
The simplest is to wrap potentially problematic code in `try()`

```R
g <- function(val) {
  log10(val)
}

> g(3)
[1] 0.4771213

> g("3")
Error in log10(val) : non-numeric argument to mathematical function

# with try() and a default value
h <- function(val) {
  result <- NA
  try(result <- log10(val))
  result
}

> h(3) # works as before
[1] 0.4771213

> h("3") # returns a default value plus the error message
Error in log10(val) : non-numeric argument to mathematical function
[1] NA
```

## `warning()` and `message()`

These are non-fatal conditions, to warn of a problem that the program could at least partly recover from, or inform the user of progress in a long-running program.

```R
w <- function() {
  warning("something strange happened")
  -1
}

> w()
[1] -1
Warning message:
In w() : something strange happened

# if warnings are not wanted
> suppressWarnings(w())
[1] -1
```

The `suppressWarnings()` function can occasionally be useful within Exercism, to avoid confusing the test runner.
