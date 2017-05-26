is_perfect <- function(n){
  
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
  
  sum(find_factors(n)) + 1 == n
  
}
