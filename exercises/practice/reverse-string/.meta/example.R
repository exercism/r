library(stringr)

enable_grapheme_clusters <- TRUE

reverse <- function(text) {
  str_split(text, "") |>
    lapply(rev) |>
    sapply(paste, collapse = "")
}
