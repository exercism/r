library(magrittr)

normalized_plaintext <- function(input) {
  
  gsub("[^[:alnum:]]", "", input) %>% 
    tolower()
  
}

map_plaintext_to_matrix <- function(input) {
  
  txt <- normalized_plaintext(input)
  width <- max(1, nchar(txt) %>% sqrt() %>% ceiling())
  ext_len <- ceiling(nchar(txt) / width) * width
  txt <- sprintf(paste0("%-", ext_len, "s"), txt)
  
  strsplit(txt, "") %>% 
    unlist() %>% 
    matrix(ncol = width, byrow = TRUE)
  
}

plaintext_segments <- function(input) {
  
  if (!nzchar(input)) return("")
  map_plaintext_to_matrix(input) %>% 
    apply(MARGIN = 1, paste, collapse = "") %>% 
    trimws()
  
}

encoded <- function(input) {
  
  map_plaintext_to_matrix(input) %>% 
    apply(MARGIN = 2, paste, collapse = "") %>% 
    trimws() %>% 
    paste(collapse = "")

}

ciphertext <- function(input) {
  
  map_plaintext_to_matrix(input) %>%   
    apply(MARGIN = 2, paste, collapse = "") %>% 
    paste(collapse = " ")

}
