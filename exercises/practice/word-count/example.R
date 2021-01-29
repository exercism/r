library(magrittr)

word_count <- function(input) {
  
  input <- gsub("[[:punct:]]", "", tolower(input))
  input <- strsplit(input, " ")[[1]]
  
  input[nchar(input) > 0] %>% 
    table() %>% 
    as.list()
  
}
