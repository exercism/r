# Not the prettiest code, but it passes the tests reasonably quickly

prime <- function(n) {
  if (n < 1) stop("n must be a positive integer")
  
  known <- vector("integer", n) # to store primes as we find them
  
  is_prime <- function(candidate) {
    sqrt_candidate <- sqrt(candidate)
    for (item in known) {
      if (item > sqrt_candidate) return(TRUE)
      if (candidate %% item == 0) return(FALSE)
      TRUE
    }
  }
  
  # Early primes are added explicitly:
  known[1] <- 2
  known[2] <- 3
  
  # Prime candidates are 6i +/- 1 : 5, 7, 11, 13...
  # Python does this with `itertools.choice()`. Is there an equivalent in R?
  known_count <- 2
  number <- 6
  repeat {
    for (candidate in c(number - 1, number + 1)) {
      if (known_count >= n) return(known[n]) # result!
      if (is_prime(candidate)) {
        known_count <- known_count + 1
        known[known_count] <- candidate
      }
    }
    number <- number + 6
  }
}
