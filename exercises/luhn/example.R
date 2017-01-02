# Convert a number to a valid number, if it isn't already.
luhn <- function(input) {
  if (is_valid(input)) {
    return(input)
  }
  diff <- (10 - checksum(10*input)) %% 10
  return(10 * input + diff)
}

# Get the check digit
check_digit <- function(input) {
  as.numeric(substring(input,nchar(input))) 
}

# Compute the checksum
checksum <- function(input) {
  sum(addends(input))
}

# Determine whether the number is valid.
is_valid <- function(input) {
  checksum(input) %% 10 == 0
}

# addends returns the vector of numbers that follow the luhn algorithm
addends <- function(input) {
  check <- check_digit(input)
  v <- as.numeric(strsplit(as.character(input),"")[[1]])
  # counting from right double value of every second digit
  start_seq <- ifelse(length(v) %% 2 == 1, 0, 1)
  v2 <- replace(v,seq(start_seq,length(v),2),v[seq(start_seq,length(v),2)]*2)
  v2 <- ifelse(v2 > 9, v2 - 9, v2)
  replace_vals <- v2[seq(start_seq,length(v),2)]
  replace(v,seq(start_seq,length(v),2),replace_vals)
}
