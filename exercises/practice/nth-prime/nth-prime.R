
prime <- function(n) {
  if (n < 1) stop("n must be a positive integer")
  
  known <- vector("integer", n)
  is_prime <- function(candidate) {
    sqrt_candidate <- sqrt(candidate)
    for (item in known) {
      if (item > sqrt_candidate) return(TRUE)
      if (candidate %% item == 0) return(FALSE)
      TRUE
    }
  }
  
  known[1] <- 2
  known[2] <- 3
  known_count <- 2
  number <- 6
  while (TRUE) {
    if (known_count >= n) return(known[n])
    if (is_prime(number - 1)) {
      known_count <- known_count + 1
      known[known_count] <- number - 1
    }
    if (known_count >= n) return(known[n])
    if (is_prime(number + 1)) {
      known_count <- known_count + 1
      known[known_count] <- number + 1
    }
    number <- number + 6
  }
  
}