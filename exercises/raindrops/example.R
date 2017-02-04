raindrops <- function(number) {
  
  Pling <- ''
  Plang <- ''
  Plong <- ''
  
  # If the number has 3 as a factor, output 'Pling'.
  if (number %% 3 == 0) {
    Pling <- 'Pling'
  }
  # If the number has 5 as a factor, output 'Plang'.
  if (number %% 5 == 0) {
    Plang <- 'Plang'
  }
  # If the number has 7 as a factor, output 'Plong'.
  if (number %% 7 == 0) {
    Plong <- 'Plong'
  }
  
  PlingPlangPlong <- paste(Pling, Plang, Plong, sep = "")
  
  # If the number does not have 3, 5, or 7 as a factor, just pass the number's digits straight through.
  if (PlingPlangPlong == "") {
    PlingPlangPlong = as.character(number)
  }
  
  PlingPlangPlong
}
