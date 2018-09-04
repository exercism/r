acronym <- function(input) {
  # split the string by spaces or hyphens
  split <- strsplit(input, " |-")
  
  # get the first letter of each substring
  first_letters <- substring(split[[1]], 1, 1)

  # join the acronym back together & make uppercase
  acronym <- paste(toupper(first_letters), collapse = "")
  
  return(acronym)
}
