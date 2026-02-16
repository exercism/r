# Introduction

Many languages have a way such as `null` or `none` to indicate a non-existent value.
Because R is designed to handle large volumes of (often messy) data, it has multiple forms of nothingness.

The overall aim is to flag missing or suspect values as they are encountered, then continue without raising an exception.

## NULL

If a value really doesn't exist, it is repesented by `NULL`. This is probably closest to what C or Python might do.

```R
v <- c() # zero-length vector
v
#> NULL
is.null(v)
#> [1] TRUE
```

In many contexts, `NULL` values are simply ignored:

```R
c(2, 3, NULL, 5)
#> [1] 2 3 5
```

## NA

For situations where a value exists but we don't know what it is, `NA` is used. For example, when counting vehicles traveling on a road, human observers might go off sick or automatic sensors break down, but the traffic continues to flow.

```R
v <- c(1, 2, NA, 4, 5)
v
#> [1]  1  2 NA 4  5
is.na(v) # test for data gaps
#> [1] FALSE FALSE  TRUE FALSE FALSE
```

Thus `NA` is a placeholder, warning humans that they need to make a decision about how to handle this.
