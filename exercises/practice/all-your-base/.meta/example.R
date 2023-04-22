
from_digits <- function(digits, base) {
  sum(digits * base^((length(digits) - 1):0))
}

to_digits <- function(number, base_to) {
  if (number == 0) {
    return(0)
  }

  result <- c()
  while (number > 0) {
    result <- append(result, number %% base_to)
    number <- number %/% base_to
  }
  rev(result)
}

rebase <- function(from_base, digits, to_base) {
  if (from_base < 2) stop("input base must be >= 2")
  if (to_base < 2) stop("output base must be >= 2")

  if (is.null(digits)) {
    return(c(0))
  }
  if (any(digits < 0) || any(digits >= from_base)) {
    stop("all digits must satisfy 0 <= d < input base")
  }

  to_digits(from_digits(digits, from_base), to_base)
}
