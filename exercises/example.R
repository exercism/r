prime_factors <- function(number) {
  factors <- c();
  lowest.factor = 2;
  while (number > 1) {
    if (number%%lowest.factor == 0) {
      number <- number/lowest.factor;
      factors[length(factors) + 1] = lowest.factor;
    }
    else {
      lowest.factor <- lowest.factor + 1;
    }
  }
  return(factors);
}