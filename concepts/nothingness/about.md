# About

Many languages have a way such as `null` or `none` to indicate a non-existent value.
Because R is designed to handle large volumes of (often messy) data, it has multiple forms of nothingness.

The overall aim is to flag missing or suspect values as they are encountered, then continue without raising an exception.

## NULL

If a value really doesn't exist, it is repesented by `NULL`. This is probably closest to what C or Python might do.

```R
> v <- c() # zero-length vector
> v
NULL
> is.null(v)
[1] TRUE
```

In many contexts, `NULL` values are simply ignored:

```R
> c(2, 3, NULL, 5)
[1] 2 3 5
```

## NA

For situations where a value exists but we don't know what it is, `NA` is used. For example, when counting vehicles traveling on a road, human observers might go off sick or automatic sensors break down, but the traffic continues to flow.

```R
> v <- c(1, 2, NA, 4, 5)
> v
[1]  1  2 NA 4  5
> is.na(v) # test for data gaps
[1] FALSE FALSE  TRUE FALSE FALSE
```

Thus `NA` is a placeholder, warning humans that they need to make a decision about how to handle this.

Statistical functions usually return `NA` by default if `NA` values are present. 
If you want these values to be ignored, use the `na.rm` (NA remove) parameter to make this explicit:

```R
> v <- c(1, 2, NA, 4, 5)
> mean(v)
[1] NA
> mean(v, na.rm = TRUE)
[1] 3
```

## NaN

Short for "Not a Number", this flags a computation problem in situations where a number was expected.

```R
> n <- c(0, 2, 4)
> d <- c(0, 1, 2)
> n / d
[1] NaN   2   2  # 0/0 is mathematically undefined

```

This is not the only possibility for "invalid" calculations. 
Dividing by zero will return `Inf` or `-Inf` for a non-zero numerator, without raising an error.
