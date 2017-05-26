pascals_triangle <- function(n) {

  if (n == 0) {
    return(list())
  }
  else if (n == 1) {
    return(list(1))
  }
  else if (n == 2) {
    return(list(1, c(1, 1)))
  }
  else if (n >= 3) {
    triangle <- list(1, c(1, 1))
    for (x in 3:n) {
      row <- rep(1, x)
      for (i in 2:(x - 1)) {
        row[i] <- sum(triangle[[x - 1]][(i - 1):i])
      }
      triangle[[x]] <- row
    }
    return(triangle)
  }
  else {
    stop("argument n needs to be an integer")
  }
  
}
