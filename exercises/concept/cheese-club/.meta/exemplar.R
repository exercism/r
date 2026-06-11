library(tidyverse)

all_15 <- function(ratings) {
  ratings |> every(\(x) x %in% c(1, 5))
}

name_customers <- function(names, ratings) {
  map2(names, ratings, \(n, r) list(name = n, rating = r))
}

emphatics <- function(names, ratings) {
  name_customers(names, ratings) |> keep(\(customer) all_15(customer$rating))
}

to_binary <- function(ratings) {
  if_else(ratings == 5, 1, 0)
}
