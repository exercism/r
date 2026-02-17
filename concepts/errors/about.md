# About

As explored in the [`Nothingness`][concept-nothingness] concept, R has various ways to represent data which is absent ([`NULL`][ref-null]), unknown ([`NA`][ref-na]) or mathematically invalid ([`NaN`][ref-finite], [`Inf`][ref-finite]).
In general, R will try to use values these to flag problems in-place, and continue without raising an exception.

## `stop()`

Some problems are too fundamental to let the program continue. 
In this case, use [`stop(msg)`][ref-stop] to immediately halt the program with an `Error` and print `msg`.

```R
> f <- function() {
+     stop("I have a problem")
+ }
> f()
Error in f() : I have a problem
```

## `stopifnot()`

Similar to an [`assert`][wiki-assert] in other languages, [`stopifnot()`][ref-stopifnot] is a convenient wrapper for `stop()`.
The arguments are an arbitrary number of boolean conditions, separated by commas, and the program will only continue if all are `TRUE`.

```R
> stopifnot(1 < 2) # continues OK
> stopifnot(1 < 2, 1 == 2)
Error: 1 == 2 is not TRUE
```

## `try()`

R has a variety of ways to handle errors.
These are based on Common Lisp and differ significantly from many popular languages.

The simplest is to wrap potentially problematic code in [`try()`][ref-try].

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

## [`warning()`][ref-warning] and [`message()`][ref-message]

These are reponses to non-fatal conditions, for example:

- To warn of a problem that the program could at least partly recover from.
- To inform the user of progress in a long-running program.

One difference between them is that warnings are cached and (by default) output when the function returned, but messages are output immediately.
There are many ways to change the default behavior, beyond our scope here.

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

The [`suppressWarnings()`][ref-warning] function can occasionally be useful within Exercism, to avoid confusing the test runner with unwanted output.

## Condition handlers

R has an alternative way to deal with error states, closer in spirit to the approach of Java and related languages.

Details are beyond our scope in this Concept, but anyone interested should look at [`tryCatch`][ref-conditions] and [`withCallingHandlers`][ref-conditions].

There is a good discussion in [Section 8.4][book-handling] of Advanced R.

[ref-null]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/NULL
[ref-na]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/NA
[ref-finite]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/is.finite
[ref-stop]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/stop
[ref-stopifnot]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/stopifnot
[ref-try]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/try
[ref-conditions]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/conditions
[ref-warning]: https://www.rdocumentation.org/packages/base/versions/3.2.4/topics/warning
[ref-message]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/message
[concept-nothingness]: https://exercism.org/tracks/r/concepts/nothingness
[wiki-assert]: https://en.wikipedia.org/wiki/Assertion_(software_development)
[book-handling]: https://adv-r.hadley.nz/conditions.html
