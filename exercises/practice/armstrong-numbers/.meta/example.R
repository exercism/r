to_digits <- function(n) {
  chars <- n |> as.character() |> strsplit("")
  as.numeric(chars[[1]])
}

is_armstrong_number <- function(n) {
  digits <- to_digits(n)
  sum(digits ^ length(digits)) == n
}
