is_perfect <- function(n){
  
  # catch invalid input
  if (n <= 0)
    stop("Classification is only possible for natural numbers.")
  
  # catch edge cases
  if (n %in% c(1, 2))
    return("deficient")
  
  find_factors <- function(n) {
    factors <- c()
    for (i in 2:floor(n^0.5 + 1)) {
      
      if (n %% i == 0) {
        if (i^2 != n) {
          factors <- c(factors, i, n / i)
        }
        else {
          factors <- c(factors, i)
        }
      }
            
    }
    unique(factors)
  }
  
  sum <- sum(find_factors(n)) + 1
  
  # alternative to multiple if/else statements
  type <- dplyr::case_when(sum == n ~ "perfect",
                             sum > n ~ "abundant",
                             sum < n ~ "deficient")
  
  type
}
