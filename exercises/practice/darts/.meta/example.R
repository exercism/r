score <- function(x, y) {
  # points <- data.frame(row = numeric(), col = numeric())
  # dims <- dim(input)
  # for (row in seq_len(dims[1])) {
  #   row_max <- max(input[row, ])
  #   for (col in seq_len(dims[2])) {
  #     if (input[row, col] == row_max &&
  #       input[row, col] == min(input[, col])) {
  #       points <- rbind(points, data.frame(row = row, col = col))
  #     }
  #   }
  # }
  # points

  radius <- sqrt(x^2 + y^2)
  if (radius <= 1) return(10)
  if (radius <= 5) return(5)
  if (radius <= 10) return(1)
  0
}
