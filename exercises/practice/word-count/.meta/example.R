word_count <- function(input) {
  input <- tolower(input)
  input <- gsub("[^[:alnum:]']", " ", input)
  input <- strsplit(input, "[[:space:]]")[[1]]
  input <- gsub("^'", "", input)
  input <- gsub("'$", "", input)
  input[nchar(input) > 0] %>%
    table() %>%
    as.list()
}
