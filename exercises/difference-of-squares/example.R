difference_of_squares <- function(natural_number) {
  num_sequence <- seq_len(natural_number)
  square_sums <- sum(num_sequence)^2
  sum_squares <- sum(num_sequence^2)
  sum(square_sums - sum_squares)
}