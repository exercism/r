# Introduction

There is no single, obvious solution to this exercise, but a diverse array of working solutions have been used.

## General guidance

Roman numerals are limited to positive integers from 1 to 3999 (MMMCMXCIX).
In the version used for this exercise, the longest string needed to represent a Roman numeral is 14 characters (MMDCCCLXXXVIII).
Minor variants of the system have been used which represent 4 as IIII rather than IV, allowing for longer strings, but those are not relevant here.

The system is inherently decimal: the number of human fingers has not changed since ancient Rome, nor the habit of using them for counting. However, there is no zero value available, so Roman numerals represent powers of 10 with different letters (I, X, C, M), not by position (1, 10, 100, 1000).

The approaches basically break down into two groups, with many variants in each:
1. Split the input number into digits, and translate each separately.
2. Iterate through the Roman numbers, from large to small, and convert the largest valid number at each step.

## Digit-by-digit approaches

The concept behind this class of approaches is to:
- Split the input number into decimal digits.
- For each digit, get the Roman equivalent and append to a vector.
- Join the vector into a string and return it.
Depending on the implementation, there may need to be a vector-reverse step.

The conversion is conveniently done with some form of 2-D lookup table, however implemented:

```r
roman <- function(arabic) {
  conversion = list(
    c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"),
    c("X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"),
    c("C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"),
    c("M", "MM", "MMM"))

  digits <- arabic |>
    as.character() |>
    strsplit("") |>
    unlist() |>
    as.numeric()
  
  inverter <- length(digits) + 1
  roman_digits <- c()
  for (i in seq_along(digits)) {
    roman_digits <- c(roman_digits, conversion[[inverter - i]][digits[i]])
  }
  paste(roman_digits, collapse = "")
}
```

See [`table-lookup`][table-lookup] for details.


## Loop over Romans approaches

In this class of approaches we:
- Create a mapping from Roman to Arabic numbers, in some suitable format.
- Iterate nested loops, a `for` and a `while`, in either order.
- At each step, append the largest possible Roman number to a list and substract the correspond value from the number being converted.
- Join the list into a string and return it.
Depending on the implementation, there may need to be a list-reverse step.

This is one example using a list of vectors:

```r
roman <- function(arabic) {
  conversion <- list(M = 1000, CM = 900, D = 500, CD = 400, 
                     C = 100, XC = 90, L = 50, XL = 40, 
                     X = 10, IX = 9, V = 5, IV = 4, I = 1)
  result <- c()
  
  for (roman in names(conversion)) {
    num <- conversion[[roman]]
    while (num <= arabic) {
      result <- append(result, roman)
      arabic <- arabic - num
    }
  }
  paste(result, collapse = "")
}
```

There are a number of variants.
See [`loop-over-romans`][loop-over-romans] for details.

## Other approaches

Many forms of data conversion are built into R, and Roman numerals are [no exception][roman].

Using this in Exercism is technically possible, but is perhaps missing the point of the exercise.

```r
as.roman(273)
# +> CCLXXIII

as.roman(c(273, 42, 1234))
# +> [1] CCLXXIII XLII     MCCXXXIV
```

From other tracks, we can see that methods with recursion and/or `if...else` condtionals can be used.
These appear to offer no special advantage in R and have not been explored.

## Which approach to use?

In production, it would make sense to use the built-in `as.roman()` method.
It is debugged and supports vector input.

At the time of writing, the R exercise is too new to have many student submissions.
Most submissions in other tracks use some variant of [`loop-over-romans`][loop-over-romans]. 

Using a [2-D lookup table][table-lookup] takes a bit more initialization, but then everything can be done in a single, unnested loop.

No performance article is currently included for this exercise.
The problem is inherently limited in scope by the design of Roman numerals, so any of the approaches is likely to be fast enough.



[table-lookup]: https://exercism.org/tracks/r/exercises/roman-numerals/approaches/table-lookup
[loop-over-romans]: https://exercism.org/tracks/r/exercises/roman-numerals/approaches/loop-over-roman
[roman]: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/roman.html
