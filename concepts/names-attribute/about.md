# About

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

2) By assigning a character vector to [`names()`][ref-names]

```R
> months <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
> names(months) <- month.abb
> months
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
 31  28  31  30  31  30  31  31  30  31  30  31 
```

3) With [`setNames()`][ref-setnames]

```R
> months <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
> setNames(months, month.name)
  January  February     March     April       May      June      July    August September   October  November  December 
       31        28        31        30        31        30        31        31        30        31        30        31 
```

## Removal

If names are no longer wanted they can be removed by setting to [`NULL`][ref-null]

```R
> work_days
  Mon   Tue   Wed   Thu   Fri   Sat   Sun 
 TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE 
> names(work_days) <- NULL
> work_days
[1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
```

The [`unname()`][ref-unname] function achieves the same thing, and perhaps make your intention clearer.

## Working with names

The [`names()`][ref-names] function can retrieve names as well as set them.

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

## More advanced topics

Many R objects, including `vectors`, can have arbitrary attributes attached to them. The `names` attribute is just one example, though a particularly common and important one.

In practice, names are sometimes useful for vectors but rarely essential. The `names-attribute` becomes much more important for more complex structures such as [`lists`][concept-lists] and [`dataframes`][concept-dataframes], as we shall see in future concepts.

[ref-names]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/names
[ref-setnames]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/setNames
[ref-unname]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unname
[ref-null]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/NULL
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[concept-dataframes]: https://exercism.org/tracks/r/concepts/dataframes
