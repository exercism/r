diamond <- function(letter) {

  nrows <- which(LETTERS == letter)
  
  row_x <- function(x, rows = nrows) {
    row <- rep(" ", rows * 2 - 1)
    row[rows - (x - 1)] <- LETTERS[x]
    row[rows + (x - 1)] <- LETTERS[x]
    paste(row, collapse = "")
  }
  
  top <- lapply(seq(nrows), row_x)
  paste(c(top, rev(top)[-1]), collapse = "\n")

}
