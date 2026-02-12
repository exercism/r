# About

There are basically two types of loops:

1. Loop until a condition is satisfied.
2. Loop over the elements in a collection.

Both are possible in R], though the first may be more common.

## `while` and `repeat`

For open-ended problems where the number of times round the loop is not known in advance, R has the `while` loop with a condition, and the `repeat` loop with no condition (equivalent to `while (TRUE)`).

The basic form is fairly simple:

```R
while (condition) {
  do_something()
}
```

In this case, the program will keep going round the loop until `condition` is no longer `TRUE`.

Two ways to exit the loop early are available:

- A `break` causes the loop to exit, with execution continuing at the next line after the loop's closing brace `}`.
- A `return(x)` stops execution of the current function, passing the return value `x` back to the caller.

With these options available, it can sometimes be convenient to create an "infinite" loop with `repeat { ... }`, then rely on finding a stopping condition within the loop body to trigger a `break` or `return`.

These three variants are equivalent and all end with `x == 0.4444...`

```R
x <- 12
while (x > 1) {
  x <- x / 3
}

x <- 12
while (TRUE) {
  x <- x/3
  if (x <= 1) break
}

x <- 12
# no boolean clause 
repeat { 
  x <- x/3
  if (x <= 1) break
}
```

## Iterating over a vector

This is often unnecessary in R.
As discussed in other concepts, many functions will operate on entire vectors.

However, explicit loops are sometimes unavoidable.
This is especially true when:

- The loop body has side effects such as printing or file I/O.
- Looping continues until some criterion is reached, after an unpredictable number of iterations.

The loop condition must be in parentheses.
As with function bodies, braces are optional (but often included) for single-line loop bodies.

```R
words <- c("This", "is", "a", "loop")
for (w in words) { print(w) } # the braces are optional here
#> [1] "This"
#> [1] "is"
#> [1] "a"
#> [1] "loop"
```

If the current iteration fails to satisfy some condition, it is possible to skip immediately to the next iteration with a `next`:

```R
for (n in 1:10) {
    if (is_useless(n)) next
     
    # we decided this iteration could be useful
    do_something_slow(n)
}
```

If the numerical index is needed, use `seq_along()`.

```R
v <- LETTERS[1:3]
v
#> [1] "A" "B" "C"

for (i in seq_along(v)) { print(sprintf("%s%i", v[i], i)) }
#> [1] "A1"
#> [1] "B2"
#> [1] "C3"
```

Using `i in 1:length(v)` is _not_ recommended, as it can cause problems when `length(v)` is zero.
The range `1:0` is equivalent to `c(1, 0)`, so the loop body will execute and probably fail.
The `seq_along()` function is designed to handle this case correctly.
