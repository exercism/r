saddle_point <- function(input) {
  points <- data.frame(row = numeric(), col = numeric())
  dims <- dim(input)
  for (row in seq_len(dims[1])) {
    row_max <- max(input[row, ])
    for (col in seq_len(dims[2])) {
      if (input[row, col] == row_max &&
        input[row, col] == min(input[, col])) {
        points <- rbind(points, data.frame(row = row, col = col))
      }
    }
  }
  points
}
