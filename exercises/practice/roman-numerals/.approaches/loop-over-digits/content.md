# Loop Over Digits

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

This approach is one of a family, using some mapping from Arabic (decimal) to Roman numbers.

The code above uses a list with names. Using a pair of vectors is also possible, with a shared index from the `seq_along()`. 

```r
roman <- function(arabic) {
  nums  <- c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  romans  <- c("M", "CM", "D", "CD", "C", "XC",
               "L", "XL", "X", "IX", "V", "IV", "I")
  result <- c()

  for (i in seq_along(nums)) {
    num <- nums[i]
    while (num <= arabic) {
      result <- append(result, romans[i])
      arabic <- arabic - num
    }
  }
  paste(result, collapse = "")
}
```

These solutions, and several others with different data structures for the lookup, share some common features:
- Some sort of translation lookup.
- Nested loops, a `while`and a `for`.
- At each step, find the largest number that can be subtracted from the decimal input and appended to the Roman representation.
