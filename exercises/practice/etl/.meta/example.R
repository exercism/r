etl <- function(input) {
  output <- setNames(
    unlist(input, use.names = FALSE),
    rep(names(input), lengths(input))
  )
  output <- output |>
    tolower() |>
    sort()

  setNames(output |> names() |> as.numeric(), output) |> as.list()
}
