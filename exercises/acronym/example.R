acronym <- function(input) {
  words <- strsplit(input, " |-")[[1]]
  words <- gsub("[[:punct:]]", "", words)
  first_letters <- lapply(words, substring, 1, 1)
  toupper(paste(first_letters, collapse = ""))
}
