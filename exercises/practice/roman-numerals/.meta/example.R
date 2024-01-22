library(tibble)

roman <- function(arabic) {
  nums  <-   c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  romans  <-  c("M", "CM", "D", "CD", "C", "XC",
                "L", "XL", "X", "IX", "V", "IV", "I")
  lookup <- tibble(nums, romans)
  result <-  c()

  for (i in seq_len(nrow(lookup))) {
    num <- lookup[i, "nums"][[1]]
    while (num <= arabic) {
      result <- append(result, lookup[i, "romans"][[1]])
      arabic <- arabic - num
    }
  }
  paste(result, sep = "", collapse = "")
}
