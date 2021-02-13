fizz_buzz <- function(input) {
  replace_number <- function(i) {
    if (i %% 3 == 0 && i %% 5 == 0) {
      return("Fizz Buzz")
    } else if (i %% 3 == 0) {
      return("Fizz")
    } else if (i %% 5 == 0) {
      return("Buzz")
    } else {
      return(i)
    }
  }

  out <- sapply(seq(1, input), replace_number)
  return(out)
}
