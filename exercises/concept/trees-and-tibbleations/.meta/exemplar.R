library(datasets)
library(tidyverse)

tree_data <- trees |> as_tibble() |> rename(Diameter = Girth)

girth_n_weight <- function(data, rnd_digits) {
  data |>
    mutate(Girth = pi * Diameter, Weight = 35 * Volume) |>
    round(rnd_digits)
}

orchard_copy <- function(data, important_cols) {
  data |>
    relocate(all_of(important_cols)) |>
    arrange(pick(important_cols[1]))
}

customer_copy <- function(data, attributes, min_height, max_height, max_weight) {
  data |> 
    select(all_of(attributes)) |>
    filter(between(Height, min_height, max_height) & Weight < max_weight)
}
