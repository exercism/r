acronym <- function(input) {
  words <- strsplit(input, " |-")[[1]]
  words <- gsub("[[:punct:]]", "", words)
  chrs <- lapply(words, substring, 1, 1)
  toupper(paste(chrs, collapse = ""))
}
