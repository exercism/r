sum_of_multiples <- function(factors, limit) {
  func <- function(x) seq(0, limit - 1, x)
  sum(unique(unlist(lapply(factors, func))))
}
