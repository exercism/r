library(magrittr)

is_pangram <- function(input) {

  input_letters <- gsub("[^A-Za-z]", "", input) %>% 
                    tolower() %>% 
                    strsplit("") %>% 
                    unlist() %>% 
                    unique() %>% 
                    sort()

  identical(input_letters, letters)

}
