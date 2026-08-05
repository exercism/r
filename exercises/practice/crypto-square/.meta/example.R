library(tidyverse)

ciphertext <- function(input) {
  normalized <- input |> str_to_lower() |> str_remove_all("[^a-z0-9]")
  if (normalized == "") return("")

  # R matrices are column-major
  # we will need a transpose to match the problem specification
  r <- normalized |> nchar() |> sqrt() |> ceiling()
  c <- (nchar(normalized) / r) |> ceiling()
  normalized |> 
    str_pad(c * r, "right") |>
    str_split_1("") |>
    matrix(nrow = r, ncol = c) |>
    t() |>
    apply(2, str_flatten) |>
    str_flatten(collapse = " ")
}
