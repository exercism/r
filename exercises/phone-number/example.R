parsePhoneNumber <- function(numberString) {
  
  # If the phone number is less than 10 digits assume that it is bad number
  # If the phone number is 10 digits assume that it is good
  # If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
  # If the phone number is 11 digits and the first number is not 1, then it is a bad number
  # If the phone number is more than 11 digits assume that it is a bad number
 
  # Check for letters
  if (grepl("[A-z]", numberString)) {
    return (NULL)
  }
  
  # Remove non-digit characters from number string
  cleaned <- gsub("[^0-9]", "", numberString)
  
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
