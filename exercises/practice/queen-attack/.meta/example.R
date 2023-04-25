create <- function(row, col) {
  if (row < 0) stop("row not positive")
  if (row > 7) stop("row not on board")
  if (col < 0) stop("column not positive")
  if (col > 7) stop("column not on board")

  list(row = row, col = col)
}

can_attack <- function(queen1, queen2) {
  same_row <- queen1$row == queen2$row
  same_col <- queen1$col == queen2$col
  same_diagonal <- abs(queen1$row - queen2$row) == abs(queen1$col - queen2$col)
  any(c(same_row, same_col, same_diagonal))
}
