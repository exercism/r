diamond <- function(letter) {

  nrows <- which(LETTERS == letter)
  
  row_x <- function(x) {
    row <- rep(" ", nrows * 2 - 1)
    row[nrows - (x - 1)] <- LETTERS[x]
    row[nrows + (x - 1)] <- LETTERS[x]
    paste(row, collapse = "")
  }
  
  top <- lapply(seq(nrows), row_x)
  paste(c(top, rev(top)[-1]), collapse = "\n")

}
