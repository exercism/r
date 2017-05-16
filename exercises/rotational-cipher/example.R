rotate <- function(text, key) {
  
  # Split string into character vector
  textVector <- unlist(strsplit(text, ""))
  
  # Record which characters are upper case
  upperCase <- toupper(textVector) == textVector
  
  # Rotate letter characters
  rotationIndex <- (match(tolower(textVector), letters)+key-1) %% 26 + 1
  rotatedVector <- letters[rotationIndex]
  
  # Restore non-letter characters in rotated character vector
  rotatedVector[is.na(rotatedVector)] <- textVector[is.na(rotatedVector)]
  
  # Restore upper case characters
  rotatedVector[upperCase] <- toupper(rotatedVector[upperCase])
  
  # Collapse character vector into string
  paste(rotatedVector, collapse = "")
  
}
