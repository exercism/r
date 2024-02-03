reverse <- function(text) {
  strsplit(text, "") |>
    lapply(rev) |>
    sapply(paste, collapse = "")
}
