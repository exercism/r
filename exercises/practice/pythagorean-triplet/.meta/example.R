pythagorean_triplet <- function(n) {
  triplets <- list()
  for (a in 1:n) {
    for (b in a + 1:n) {
      c <- n - a - b
      if (b < c && a^2 + b^2 == c^2) {
        triplets <- append(triplets, list(c(a, b, c)))
      }
    }
  }
  triplets
}
