prime_factors <- function(number) {
  factors <- c()
  lowest_factor <- 2
  while (number > 1) {
    if (number %% lowest_factor == 0) {
      number <- number / lowest_factor
      factors[length(factors) + 1] <- lowest_factor
    }
    else {
      lowest_factor <- lowest_factor + 1
    }
  }
  return(factors)
}
