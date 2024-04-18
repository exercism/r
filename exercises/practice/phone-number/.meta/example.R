parse_phone_number <- function(number_string) {
  str <- gsub("\\D", replacement = "", number_string)
  if (substr(str, 1, 1) == '1') str <- substr(str, 2, nchar(str))
  if (nchar(str) != 10) return(NULL)
  if (strtoi(substr(str, 1, 1)) < 2 || strtoi(substr(str, 4, 4)) < 2) return(NULL)
  str
}
