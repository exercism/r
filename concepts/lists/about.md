# About

A [`list`][ref-list] in R is an ordered collection of items, differing from `vectors` in a few ways:

- The items can be of different types (e.g. mixing `numeric` with `character`).
- The items can be complex structures (e.g. vectors, other lists, etc).
- There is some different syntax for accessing elements.

Analogies to other languages are imprecise. 
An R `list` is somewhat similar to a Python dictionary, but the `list` is ordered and can be accessed by numerical index.
It is somewhat similar to a C `struct`, except that the `list` can easily be extended at runtime.

## Creating lists

Giving [names][concept-names-attribute] (often called "tags") to the elements is more common with lists than with vectors:

```R
list(x = 5.3, y = 4.2, color = "blue")
#> $x
#> [1] 5.3

#> $y
#> [1] 4.2

#> $color
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
#> point$x
#> [1] 5.3
#> point$color
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

# str() gives more compact output than the default display
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

## Lists are "recursive vectors"

The `vector` class is technically known as [`atomic vector`][book-atomic], because it can only hold atomic values: `numeric`, `character`, `boolean`, etc. 
Because a `list` can contain other lists, it is also known as a `recursive vector`.

As well as being a technical point of nomenclature, this is a reminder that lists can have arbitrarily complex structure.
It is the programmer's responsibility to understand what will be provided when accessing a list element.

## More on list indexing

Some examples above used double brackets `[[ ]]` to access list emements. 
This will try to flatten the element to its underlying type, which is useful if you just want a number or a string.

Using single brackets `[ ]` will not do this flattening, and the returned value will be a sublist.

```R
point[["color"]]
#> [1] "red"  # flattened

point["color"]
#> $color
#> [1] "red"  # sublist
```

Even if the sublist is not what a novice R programmer is likely to want, please be aware of it.
For maximum flexibility, many standard R functions return a `list`, even when it contains a single atomic value as here.

To convert to a vector there are two possibilities.

1. Take the first element with `[[1]]`
2. Use the [`unlist()`][ref-unlist] function.

```R
pt <-point["color"]

pt[[1]]
#> [1] "red" # simple 1-element vector

unlist(pt)
#> color 
#> "red"  # 1-element vector with name
```

Be careful with `unlist()`.
Flattening the structure is useful in this simple case, but can cause surprises with more complicated list elements.

~~~~exercism/advanced
## Internal Representation

A `list`, like an atomic `vector`, is stored contiguously. The difference is that numeric and boolean vectors store *values*, but the list stores *references* to objects located elsewhere in memory.

Knowing this is rarely important for an R user, but in a polyglot community like Exercism it may be helpful to programmers familiar with other languages.
~~~~

[ref-list]: https://mathcenter.oxford.emory.edu/site/math117/rLists/
[ref-unlist]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unlist
[concept-names-attribute]: https://exercism.org/tracks/r/concepts/names-attribute
[book-atomic]: https://r4ds.had.co.nz/vectors.html#vector-basics
