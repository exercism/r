rotate <- function(text, key) {
  
  # Split string into character vector
  text_vector <- unlist(strsplit(text, ""))
  
  # Record which characters are upper case
  upper_case <- toupper(text_vector) == text_vector
  
  # Rotate letter characters
  rotation_index <- (match(tolower(text_vector), letters) + key - 1) %% 26 + 1
  rotated_vector <- letters[rotation_index]
  
  # Restore non-letter characters in rotated character vector
  rotated_vector[is.na(rotated_vector)] <- text_vector[is.na(rotated_vector)]
  
  # Restore upper case characters
  rotated_vector[upper_case] <- toupper(rotated_vector[upper_case])
  
  # Collapse character vector into string
  paste(rotated_vector, collapse = "")
  
}
