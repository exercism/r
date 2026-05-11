# About

What is functional programming?

That is a big question deserving a long answer ([Wikipedia][wiki-funcprog] provides one, [Advanced R][book-funcprog] provides another).

For our purposes, these are some key features:

- Pure functions, which map inputs to outputs consistently and with no side effects.
- Immutable data.
- First-class functions, which can be treated as values like any other type.
- Higher-order functions, which take other functions as arguments or as return values.

However, R is not a pure functional language (in contrast to, for example, Haskell).

View R as a pragmatic language, which (increasingly) provides functional capabilities where these are a clean and easy way to get a job done.
Generally, data analysis is the goal, and programming is just a means to that end.

## Pipes

The use of pipes `|>` to connect functions is an increasingly common technique in several languages.

In brief:

- A result from the left of the pipe becomes the first argument in the function to the right (where "right" ignores optional line breaks).
- Any remaining arguments can be included in the function call.
- In R, we must pipe to a function _call_, not just a _name_, so parentheses are always required (_this differs from some other languages_).

Some programmers find it helpful to pronounce the pipe as "then" when reviewing code: do step 1 THEN do step 2...

The example below illustrates the syntax.

```R
library(stringr)

"Monday-25-February" |> 
  str_split("-") |>     
  unlist() |>               # [1] "Monday"   "25"       "February"
  str_sub(1, 3) |>          # [1] "Mon" "25"  "Feb"
  str_to_upper() |>         # [1] "MON" "25"  "FEB"
  str_flatten(collapse = ", ")
#> [1] "MON, 25, FEB"
```

This type of pipe was added to Base R in v4.1.0, and you may see it referred to as the "native pipe".

Previously, piping was done with `%>%` from the `magrittr` package (the name is a [pun][wiki-pipe] for the art lovers).
The "magrittr pipe" is still available, but native pipes avoid the need for an external package, and the implementation is simpler in some details.

The RStudio editor (among others) uses `Ctrl-Shift-M` as a keyboard shortcut to add a pipe with suitable spaces.

## Apply functions

We saw previously that many functions in R are "vectorized": they will operate across entire vectors, with no need to write explicit loops.

Functions using only vectorized functions are themselves likely to be automatically vectorized.
In a trivial example:

```R
triple <- function(x) return(3 * x)
triple(1:10)
 [1]  3  6  9 12 15 18 21 24 27 30
 ```

However, more complex functions may not accept vector input, for example if they contain loops or if-else blocks.

We need a more general way to apply functions to vectors (similar to `map()` in some other languages).

Because R has a rich variety of data structures in the base language, it also has a whole family of `*apply()` functions to operate on them.
More technically, these are often called "higher-order functions" by programmers and "functionals" by mathematicians, because they takes functions as arguments.

For now, consider `lapply()` and `sapply()`.

### `lapply()`

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

v <- c("small", "large", "medium")

h(v) # bad use of an unvectorized function
Error in switch(size, small = 6, medium = 8, large = 10) : 
  EXPR must be a length 1 vector

lapply(v, h)  # output is a list
[[1]]
#> [1] 6

[[2]]
#> [1] 10

[[3]]
#> [1] 8

lapply(v, h) |> unlist() # output is a vector
#> [1]  6 10  8
```

Students familiar with the [Switch Concept][concept-switch] may notice that we could alternatively replace scalar `switch` with vectorized [`recode_values()`][ref-recode_values] from the [`dplyr`][ref-dplyr] library.
Vectorization is good, and modern R provides multiple ways to achieve it.

```R
library(dplyr)

h <- function(size) {
  recode_values(size,
         "small" ~ 6,
         "medium" ~ 8,
         "large" ~ 10
  )
}

v <- c("small", "large", "medium")
h(v)
#> [1]  6 10  8
```

### [`sapply()`][ref-lapply]

"Simplified-apply" will do something similar to `lapply`, but also tries to simplify the return value: for example,
 a named vector instead of a list.
Depending on context, use of [`unname()`][ref-unname] may be necessary:

```R
sapply(v, h)
 small  large medium 
     6     10      8 

sapply(v, h) |> unname()
#> [1]  6 10  8
```

## The `purrr` library

`lapply` and `sapply` are simple, familiar to most R users, and still quite popular for vectors and simple lists.

Base R also has several other apply functions:

- `vapply()`is similar to `sapply()` but also has a required parameter to specify the output format.
- `apply()` for matrices and higher-dimensional arrays.
- `mapply()` for multiple list or vector arguments in parallel.
- `tapply()` is harder to explain, but works with grouping operations and ragged arrays.
- `vectorize()` is a rather mysterious function, which appears to be a wrapper for `mapply()`.

_Enough, already!_

Providing a simpler and more consistent replacement for this sort of confusion is a key goal of the Tidyverse.

There is now the `purrr` package, which provides several additional options such as `map()`, while improving consistency in design, and clarity in error messages.

Less constrained by backwards compatibility than base R, this package moves R significantly closer to modern functional programming as found in other languages.

There are many and diverse functions in `purrr`, which defy easy summary.
Resources to help navigate the library include:

- A [website][web-purrr], including a [getting started][web-starting] guide.
- A [reference page][ref-purrr-funcs] for all functions.
- A PDF-format [cheat sheet][cheat-purrr].
- A guide to converting from [Base R][web-from-R].

~~~~exercism/note
The `purrr` library operates almost entirely on 1-dimensional data: vectors and lists.

We will see in a later concept that the `dplyr` library provides equivalent functionality for 2-D dataframes.
~~~~

### The many map functions

The [map()][ref-map] function applies a function to each element in the input, and always returns a [list][concept-lists].

So far, this sounds like [`lapply()`][ref-lapply], just renamed, and maybe with better error messages.

However, `map()` is just one member of a _large_ family.

Some questions to think about in picking a function:

- What do you want to return? [`map()`][ref-map] always returns a list, but if you want a particular type of atomic vector use [`map_chr()`][ref-map_chr] for strings, [`map_int()`][ref-map_int] for integers, etc.
- Do you need each positional index from the input? Preface the function names with `i`, such as [`imap()`][ref-imap].
- Do you want to process multiple inputs in parallel? 
  - Replace `map` with `map2` in the name, as in [`map2_dbl()`][ref-map2_dbl] for two inputs (e.g. values and weights, to calculate a weighted mean)
  - Replace with `pmap` for a list of parallel inputs, as in [`pmap_chr()`][ref-pmap_chr]. And yes, hardware-level parallelism is possible.
- Do you want to process all elements of the input? If not, think about [`map_if()`][ref-map_if] to apply a predicate (boolean) filter, [`map_at()`][ref-map_at] to specify positional index criteria, [`head_while()`][ref-head_while] to process the input until an element fails a predicate.
- Is the input data deeply nested? There are [functions][ref-plucks] for that situation.
- Do you want the return value to always be of the type type as the input? Use [`modify()`][ref-modify] functions instead of `map`, or [`modify_tree()`][ref-modify_tree] for recursive application.

These functions have the input data as first argument whenever possible, to ensure they work well with pipes.

Also, `purrr` is (deliberately) more pedantic than Base R. If you ask for something specific, the functions will return _exactly_ that or stop with an error message.
Harsh, but very effective at reducing hard-to-find bugs.

### Reduce functions

Map functions generally have a return value the same length as the input.

Some other functions _reduce_ the dimensionality of the data, for example `sum()`.

```R
sum(1:100)
#> [1] 5050
```

In the above case, we convert a length-100 vector to a length-1 integer.
We will see in a future Concept on matrices and arrays that the concept of dimension-reduction is more general.

The `sum()` function is built in (as are many other statistical functions).
However, we need a way to apply arbitrary dimension-reducing functions across a data structure, using some higher-order function equivalent to `map()`.

In several other languages, function names such as `fold`, `foldl` and `foldr` are used. In R, the relevant function is [`reduce()`][ref-reduce], corresponding to the well-known (to algorithm enthusiasts) [MapReduce][wiki-mapreduce] framework.

The first argument is, as usual, the input data. The second argument is a 2-argument function: often an anonymous function, but possibly as simple as an arithmetic operator such as `+`.

```R
# surround an infix operator with backticks, to use as a function
reduce(1:100, `+`)
#> [1] 5050  # same as sum(1:100)

# anonymous function, alternately add and subtract
reduce(1:10, \(accum, nextval) ifelse(nextval %% 2 == 0, accum + nextval, accum - nextval))
#> [1] 7
```

Does it matter whether we apply the function from the beginning or the end of the input?

Not with [associative][wiki-associative] operators such as `+` or `*`.
Clearly, `(1 + 2) + 3 == 1 + (2 + 3)`.

In contrast, `-` and `/` are non-associative:

```R
(1 - 2) - 3
#> [1] -4
1 - (2 - 3)
#> [1] 2
```

For functions where direction matters, there is an optional `.dir` argument.

```R
# default is .dir = "forward"
reduce(1:10, `-`)
#> [1] -53
reduce(1:10, `-`, .dir = "backward")
#> [1] -5
```

As with `map()` and `map2()`, there is also a [`reduce2()`][ref-reduce] function to operate on two input vectors in parallel.

In R, we like to work with vectors.
Suppose, instead of a single final value, you want to see all the intermediate steps.

For this, the corresponding functions are [`accumulate()`][ref-accumulate] and `accumulate2()`.
The syntax is similar to `reduce()`, with some extra optional arguments to specify output type.

```R
accumulate(1:10, `+`)
#> [1]  1  3  6 10 15 21 28 36 45 55
 ```

### Filter functions

Commonly, we want to include (or exclude) elements in the input that match some predicate.

In the [Vector Filtering][concept-vector-filtering] Concept we saw one idiomatic way to do this.

```R
v <- 1:3
v[v >= 2]
#> [1] 2 3
```

This is much-used in traditional R, but it fits poorly into modern functional pipelines.

Consequently, `purrr` provides a set of [predicate functions][ref-predicates], which follow the usual argument convention of `f(input, func, ...)` to work with pipes.

The names are a bit different from most other languages (names like `filter` and `drop` already mean something entirely different in R).

The corresponding `purrr` functions include [`keep()`][ref-keep] and [`discard()`][ref-keep], plus several others.

Also, we have [`every()`][ref-every], [`some()`][ref-every] and [`none()`][ref-every], to replace `all()` and `any()` in returning a single logical value.

## Recursion

Most functional languages use [recursion][wiki-recursion] as their preferred alternative to loops.

R has other and often better options: vectorized functions and higher-order functions.

However, recursion is supported in R, and can be useful in contexts such as traversing tree structures.

The maximum recursion depth defaults to 5000, which is relatively generous (_Python defaults to 1000_).
It is possible to override the default.

Tail-call optimization is not standard in R, though some workarounds have been developed.

Tradition demands that we show a factorial example at this point, as the classic example of a recursive definition.

```R
fact <- function(n) ifelse(n == 0, 1, n * fact(n - 1))
fact(5)
#> [1] 120

# some more idiomatic R:
factorial(5)
#> [1] 120
prod(1:5)
#> [1] 120
```

You can use recursion in R, and sometimes it is valuable, but there are often simpler approaches.

[ref-lapply]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply
[web-purrr]: https://purrr.tidyverse.org/
[web-starting]: https://purrr.tidyverse.org/articles/purrr.html
[ref-purrr-funcs]: https://purrr.tidyverse.org/reference/index.html
[cheat-purrr]: https://github.com/rstudio/cheatsheets/blob/main/purrr.pdf
[web-from-R]: https://purrr.tidyverse.org/articles/base.html
[ref-map]: https://purrr.tidyverse.org/reference/map.html
[ref-map_chr]: https://purrr.tidyverse.org/reference/map.html
[ref-map_int]: https://purrr.tidyverse.org/reference/map.html
[ref-imap]: https://purrr.tidyverse.org/reference/imap.html
[ref-map2_dbl]: https://purrr.tidyverse.org/reference/map2.html
[ref-pmap_chr]: https://purrr.tidyverse.org/reference/pmap.html
[ref-map_if]: https://purrr.tidyverse.org/reference/map_if.html
[ref-map_at]: https://purrr.tidyverse.org/reference/map_if.html
[ref-head_while]: https://purrr.tidyverse.org/reference/head_while.html
[ref-plucks]: https://purrr.tidyverse.org/reference/index.html#plucking
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[concept-switch]: https://exercism.org/tracks/r/concepts/switch
[ref-recode_values]: https://dplyr.tidyverse.org/reference/recode-and-replace-values.html
[ref-dplyr]: https://dplyr.tidyverse.org/
[wiki-mapreduce]: https://en.wikipedia.org/wiki/MapReduce
[ref-modify]: https://purrr.tidyverse.org/reference/modify.html
[ref-modify_tree]: https://purrr.tidyverse.org/reference/modify_tree.html
[ref-reduce]: https://purrr.tidyverse.org/reference/reduce.html
[ref-accumulate]: https://purrr.tidyverse.org/reference/accumulate.html
[wiki-associative]: https://en.wikipedia.org/wiki/Associative_property
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
[ref-predicates]: https://purrr.tidyverse.org/reference/index.html#predicate-functionals
[ref-keep]: https://purrr.tidyverse.org/reference/keep.html
[ref-every]: https://purrr.tidyverse.org/reference/every.html
[ref-unname]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unname
[wiki-pipe]: https://en.wikipedia.org/wiki/The_Treachery_of_Images
[wiki-funcprog]: https://en.wikipedia.org/wiki/Functional_programming
[wiki-recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[book-funcprog]: https://adv-r.hadley.nz/fp.html
