etl <- function(input) {
  output <- setNames(
    unlist(input, use.names = FALSE),
    rep(names(input), lengths(input))
  )
  output <- sort(tolower(output))

  as.list(
    setNames(
      as.numeric(names(output)),
      output
    )
  )
}
