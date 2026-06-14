library(datasets)
library(tidyverse)

tree_data <- trees |> as_tibble() |> rename(Diameter = Girth)

girth_n_weight <- function(data, rnd_digits) {
  data |>
    mutate(Girth = pi * Diameter, Weight = 35 * Volume) |>
    round(rnd_digits)
}

orchard_copy <- function(data) {
  data |>
    relocate(c(Weight, Height)) |>
    arrange(Weight)
}

customer_copy <- function(data, min_height, max_height, max_weight) {
  data |> 
    select(c(Height, Weight, Diameter, Girth)) |>
    filter(between(Height, min_height, max_height) & Weight < max_weight)
}
