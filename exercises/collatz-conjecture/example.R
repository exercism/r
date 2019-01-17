collatz_scalar <- function(num) {

  if (num <= 0) {
    stop("Only positive numbers are allowed")
  } else if (num == 1) {
    return(0)
  } else if (num %% 2 == 0) {
    return(1 + collatz_step_counter(num / 2))
  } else {
    return(1 + collatz_step_counter(3 * num + 1))
  }

}

collatz_step_counter <- Vectorize(collatz_scalar)
