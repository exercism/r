word_count <- function(input) {
  input <- gsub("[[:punct:]]","",tolower(input))
  input <- strsplit(input, " ")[[1]]
  as.list(table(input[nchar(input)>0]))
}
