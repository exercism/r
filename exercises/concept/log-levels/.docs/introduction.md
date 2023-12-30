# Introduction

R makes no distinction between strings and characters, so `"A"` is just a one-character string.

To find the length of a string, use `nchar()`.
Using `length()` will return the length of the underlying `vector` of strings, typically 1 as in this case:

```R
> x <- "Some string"
> length(x) # length of underlying vector
[1] 1
> nchar(x) # length of string
[1] 11
````

## Constructing strings

To concatenate several strings we have `paste()`.
The default separator is a space, so override this if necessary.

```R
> paste("Mon", "Tue", "Wed", sep = "")
[1] "MonTueWed"
```

Numbers will be converted to strings as necessary.

There is also `sprintf()`, taken directly from C with identical syntax.
This allows precise formatting of the output string.
At its simplest just use `%s` as a placeholder for each string you want to interpolate, then add the value(s) as comma-separated parameters.

```R
> sprintf("Hello, %s, nice to see you", "Carol")
[1] "Hello, Carol, nice to see you"
```

## String parts

For a substring whose position is known:

```R
> x <- "Some string"
> substr(x, 3, 6)
[1] "me s"
```

The start and end indices are both inclusive.

To split on some separator, such as space:

```R
> strsplit(x, " ")[[1]]
[1] "Some"   "string"
```

One thing to beware of is that this (like several string functions) returns a `list`. 
If you have not yet unlocked that concept, just add `[[1]]` in double brackets to get the vector in the first element of the list.
Details will become clearer later in the syllabus.

## Whitespace

Leading and/or trailing whitespace can be removed with `trimws()`:

```R
> s <- "    messy string   "
> trimws(s)
[1] "messy string"
```

There is a `which = "left"` (or "right") parameter to only trim one end.
