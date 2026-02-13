# Introduction

Vectors can have named elements, which sometimes makes them more convenient to work with.

## Creation

There are three ways to add names to a vector.

1) At vector creation time 

```R
> work_days <- c(Mon = TRUE, Tue = TRUE, Wed = TRUE, Thu = TRUE, Fri = TRUE, Sat = FALSE, Sun = FALSE)
> work_days
  Mon   Tue   Wed   Thu   Fri   Sat   Sun 
 TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE 
```

2) By assigning a character vector to `names()`

```R
> months <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
> names(months) <- month.abb
> months
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
 31  28  31  30  31  30  31  31  30  31  30  31 
```

3) With `setNames()`

```R
> months <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
> setNames(months, month.name)
  January  February     March     April       May      June      July    August September   October  November  December 
       31        28        31        30        31        30        31        31        30        31        30        31 
```

## Removal

If names are no longer wanted they can be removed by setting to `NULL`

```R
> work_days
  Mon   Tue   Wed   Thu   Fri   Sat   Sun 
 TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE 
> names(work_days) <- NULL
> work_days
[1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
```

The `unname()` function achieves the same thing, and may make your intention clearer.

## Working with names

The `names()` function can retrieve names as well as set them.

```R
> names(months) <- month.abb
> names(months)[1:3]
[1] "Jan" "Feb" "Mar"
```

A name can be used in place of the position index, with quotes required in this case.

```R
> months[c("Jul", "Aug")]
Jul Aug 
 31  31 
```

For such indexing to work correctly, it is best to ensure that names are unique and non-missing.
However, R does not enforce uniqueness.

The usual vector operations still work, and names usually will be preserved if that makes sense.

```R
> months[months == 30]
Apr Jun Sep Nov 
 30  30  30  30 

> sum(months)
[1] 365  # no meaningful names possible
```
