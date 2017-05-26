square <- function(n) {

  if (n > 0 & n < 65) {
    2 ^ (n - 1)
  }
  else {
    stop("Input value should be between 1 and 64")
  }

}

total <- function() {

  sum(2 ^ (0:63))

}
