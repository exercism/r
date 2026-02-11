# Introduction

A `list` in R is an ordered collection of items, differing from `vectors` in a few ways:
- The items can be of different types (e.g. mixing `numeric` with `character`).
- The items can be complex structures (e.g. vectors, other lists, etc).
- There is some different syntax for accessing elements.

Analogies to other languages are imprecise. 
An R `list` is somewhat similar to a Python dictionary, but the `list` is ordered and can be accessed by numerical index.
It is somewhat similar to a C `struct`, except that the `list` can easily be extended at runtime.

## Creating lists

Giving names (often called "tags") to the elements is more common with lists than with vectors:

```R
list(x = 5.3, y = 4.2, color = "blue")
$x
#> [1] 5.3

$y
#> [1] 4.2

$color
#> [1] "blue"
```

However, tags are optional and R will then just use index numbers:

```R
list(5.3, 4.2, "blue")
#> [[1]]
#> [1] 5.3

#> [[2]]
#> [1] 4.2

#> [[3]]
#> [1] "blue"
```

## Accessing list elements

There are three ways to do this, each useful in different contexts.

### 1. With `$tag` notation

Very common if the tag names are known in advance.

```R
point <- list(x = 5.3, y = 4.2, color = "blue")
point$x
#> [1] 5.3
point$color
#> [1] "blue"
```

### 2. With `[[tag]]` notation

This has the advantage that the tag name can be chosen at runtime.
Note the double brackets.

```R
want <- "y"
point[[want]] # same as point$y
#> [1] 4.2
```

### 3. With position index

This works whether or not the list has tags.
Again, brackets are doubled.

```R
point[[3]] # same as point$color
#> [1] "blue"
```

## Adding and deleting elements

Simple: assigning to an element will modify if it exists or insert if it is new.

```R
point$color <- "red"
point$trust <- TRUE
str(point)
#> List of 4
#>  $ x    : num 5.3
#>  $ y    : num 4.2
#>  $ color: chr "red"
#>  $ trust: logi TRUE
```

To delete, assign `NULL` to the unwanted element.

```R
point$trust <- NULL
str(point)
#> List of 3
#>  $ x    : num 5.3
#>  $ y    : num 4.2
#>  $ color: chr "red"
```
