parse_phone_number <- function(number_string) {
  
  # If the number is less than 10 digits assume that it is bad number
  # If the number is 10 digits assume that it is good
  # If the number is 11 digits and the first number is 1, use the last 10 digits
  # If the number is 11 digits and the first number is not 1, it is a bad number
  # If the number is more than 11 digits assume that it is a bad number
 
  # Check for letters
  if (grepl("[A-z]", number_string)) {
    return (NULL)
  }
  
  # Remove non-digit characters from number string
  cleaned <- gsub("[^0-9]", "", number_string)
  
  if (nchar(cleaned) < 10) {
    NULL
  } 
  else if (nchar(cleaned) == 10) {
    cleaned
  } 
  else if (nchar(cleaned) == 11 & substr(cleaned, 1, 1) == "1") {
    substr(cleaned, 2, 11)
  }
  else {
    NULL
  }
 
}
