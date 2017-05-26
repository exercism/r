library(magrittr)

# Determine whether the number is valid.
is_valid <- function(input) {

  # Strip spaces, check length & check for invalid characters
  input_vector <- gsub(pattern = " ", replacement = "", input) %>% 
                    strsplit("") %>% 
                    unlist()
  if (length(input_vector) < 2 || any(grepl("[^[:digit:]]", input_vector))) {
    return(FALSE)
  }

  # Convert to numeric
  num_vector <- as.numeric(input_vector)

  # Double every second digit starting from the right
  num_vector <- rev(num_vector)
  num_vector[seq(2, length(num_vector), 2)] <- 
    num_vector[seq(2, length(num_vector), 2)] * 2

  # Subtract 9 if > 9 (can apply to all since no
  # digit can be greater than 9 before doubling)
  num_vector <- ifelse(num_vector > 9, num_vector - 9, num_vector)

  # Check checksum is divisible by 10
  sum(num_vector) %% 10 == 0

}
