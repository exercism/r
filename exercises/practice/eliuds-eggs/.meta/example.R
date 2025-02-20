egg_count <- function(display_value) {
  display_value |>
    intToBits() |>
    as.integer() |>
    sum()
}
