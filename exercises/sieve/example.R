sieve <- function(limit) {
  if (limit < 2) {
    return(c())
  }
  nums <- rep(TRUE, limit)
  nums[1] <- FALSE
  for (i in 2:limit) {
    if (nums[i]) {
      div <- floor(limit / i)
      if (div > 1) {
        nums[i * 2:div] <- FALSE  
      }
    }
  }
  which(nums)
}
