saddle_point <- function(input) {
  points <- data.frame()
  if (length(input) == 0) {
    return(points)
  }
  dims <- dim(input)
  for (row in 1:dims[1]) {
    for (col in 1:dims[2]) {
      if (input[row, col] == min(input[, col]) && input[row, col] == max(input[row, ])) {
        points <- rbind(points, data.frame(row = row, col = col))
      }
    }
  }
  points
}
