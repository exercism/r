bob <- function(input) {
  # function bob takes a character input and responds
  # with a couple different sentences

  # strip white space
  input <- gsub("[[:space:]]", "", input)

  if (input == "") {
    return("Fine. Be that way!")
  }
  if (toupper(input) == input && 
      tolower(input) != input && 
      endsWith(input, "?")) {
    return("Calm down, I know what I'm doing!")
  }
  if (toupper(input) == input && tolower(input) != input) {
    return("Whoa, chill out!")
  }
  if (endsWith(input, "?")) {
    return("Sure.")
  }
  return("Whatever.")
}
