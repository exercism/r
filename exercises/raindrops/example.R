raindrops <- function(number) {
  
  pling <- ''
  plang <- ''
  plong <- ''
  
  # If the number has 3 as a factor, output 'Pling'.
  if (number %% 3 == 0) {
    pling <- 'Pling'
  }
  # If the number has 5 as a factor, output 'Plang'.
  if (number %% 5 == 0) {
    plang <- 'Plang'
  }
  # If the number has 7 as a factor, output 'Plong'.
  if (number %% 7 == 0) {
    plong <- 'Plong'
  }
  
  plingplangplong <- paste(pling, plang, plong, sep = "")
  
  # If the number does not have 3, 5, or 7 as a factor, 
  # just pass the number's digits straight through
  if (plingplangplong == "") {
    plingplangplong <- as.character(number)
  }
  
  plingplangplong
}
