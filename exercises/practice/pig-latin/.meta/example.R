translate_word <- function(word) {
  if (grepl("^([aeiou]|xr|yt)", word, perl = TRUE)) {
    return(paste0(word, "ay"))
  }
  sub("^([^aeiou]*?qu|[^aeiou]+?(?=[aeiouy]))(.*)$", "\\2\\1ay", word, perl = TRUE)
}

translate <- function(text) {
  words <- strsplit(text, " ")[[1]]
  paste(vapply(words, translate_word, character(1)), collapse = " ")
}
