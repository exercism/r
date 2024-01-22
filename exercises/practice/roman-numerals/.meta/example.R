roman <- function(arabic) {
  nums  <- c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  romans  <- c("M", "CM", "D", "CD", "C", "XC",
               "L", "XL", "X", "IX", "V", "IV", "I")
  result <- c()
  
  for (i in 1:length(nums)) {
    num <- nums[i]
    while (num <= arabic) {
      result <- append(result, romans[i])
      arabic <- arabic - num
    }
  }
  paste(result, sep = "", collapse = "")
}
