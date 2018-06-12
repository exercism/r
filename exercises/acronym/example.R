acronym <- function(input) {
  # split the string by spaces or hyphens
  split <- strsplit(input, " |-")
  
  #get the first letter of each substring
  first_letters <- substring(split[[1]], 1, 1)
  
  return(paste(toupper(first_letters), collapse=""))
}