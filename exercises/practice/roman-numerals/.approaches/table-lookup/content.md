# Table Lookup

```r
roman <- function(arabic) {
  conversion = list(
    c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"),
    c("X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"),
    c("C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"),
    c("M", "MM", "MMM"))

  # convert integer to a vector of single digits
  digits <- arabic |>
    as.character() |>
    strsplit("") |>
    unlist() |>
    as.numeric()
  
  inverter <- length(digits) + 1
  roman_digits <- c()

  # iterate through the digits, converting to Roman at each step
  for (i in seq_along(digits)) {
    roman_digits <- c(roman_digits, conversion[[inverter - i]][digits[i]])
  }

  # convert to a single string and return
  paste(roman_digits, collapse = "")
}
```

In this approach we loop over decimal digits, not their Roman equivalents.

The key point is to have a 2-dimensional lookup table, with each row corresponding to a separate digit: ones, tens, hundreds, thousands.
Each digit can then be converted to its Roman equivalent with a single lookup.

This relies on the fact that both systems are base-10, despite this being less obvious in the Roman case.

In the code above, the "table" is implemented as a list of vectors, which allows for different "row" lengths.
Other data structures are possible, such as dataframes or tibbles, provided the thousands row is padded with empty strings or `NA` values to make the table a regular rectangle.

## Optional modifications

In the example code, we used the `inverter` variable to work bottom-to-top through the lookup table.
This allows working left-to-right through the decimal digits.

Alternatively, we could reverse the `digits` vector, go top-to-bottom through the lookup table, then reverse the `roman_digits` vector before the final `paste()`.
On balance, this seems unnecessary.

## Credit

This approach was adapted from one created by @cmcaine on the Julia track.
