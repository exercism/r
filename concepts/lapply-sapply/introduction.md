# Introduction

We saw previously that many functions in R are "vectorized": they will operate across entire vectors, with no need to write explicit loops. 

Functions using only vectorized functions are themselves likely to be automatically vectorized.
In a trivial example:

```R
> triple <- function(x) return(3 * x)
> triple(1:10)
 [1]  3  6  9 12 15 18 21 24 27 30
 ```

However, more complex function bodies may not be fully vectorized, for example if they contain loops or if-else blocks. 
Then we need a way to apply them to vectors (similar to `map()` in some other languages).

Because R has a rich variety of data structures in the core language, it also has a whole family of `*apply()` functions to operate on them.
For now, consider `lapply()` and `sapply()`.

## `lapply()`

"List-apply" is designed to work on list inputs, but vectors will be silently coerced to lists as necessary.

The output is a list, so this may need unpacking to get a vector:

```R
h <- function(size) {
    switch(size,
           "small" = 6,
           "medium" = 8,
           "large" = 10
    )
}

> v <- c("small", "large", "medium")

> h(v) # bad use of an unvectorized function
Error in switch(size, small = 6, medium = 8, large = 10) : 
  EXPR must be a length 1 vector

> lapply(v, h)  # output is a list
[[1]]
[1] 6

[[2]]
[1] 10

[[3]]
[1] 8

> unlist(lapply(v, h)) # output is a vector
[1]  6 10  8
```

## `sapply()`

"Simplified-apply" will do something similar, but returns a named vector. 
Depending on context, use of `unname()` may be necessary:

```R
> sapply(v, h)
 small  large medium 
     6     10      8 

> unname(sapply(v, h))
[1]  6 10  8
```
