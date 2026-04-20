library(stringr)
library(purrr)

annotate <- function(garden) {

  process_square <- function(z) {
    # Converts a complex-valued board position to an output character
    value <- gardenm[Re(z), Im(z)]
    if (value == "*") {
      return("*")
    }
    if (value == " ") {
      count <- count_adjacent(z)
      ifelse(count > 0, as.character(count), " ")
    }
  }

  count_adjacent <- function(z) {
    # counts mines in valid adjacent squares in the complex plane
    adj_squares <- z + outer(-1:1, -1:1 * 1i, "+")
    adj_squares <- adj_squares[Re(adj_squares) %in% 1:rows &
                                 Im(adj_squares) %in% 1:cols]
    neighbors <- sapply(adj_squares, \(sq) gardenm[Re(sq), Im(sq)] == "*")
    sum(neighbors)
  }

  rows <- length(garden)
  if (rows == 0) return(c())

  cols <- nchar(garden[1])
  if (cols == 0) return(c(""))

  # Convert input vector of strings to character matrix
  gardenm <- str_split(garden, "") |>
    unlist() |>
    matrix(nrow = rows, ncol = cols, byrow = TRUE)

  # Return vector of strings
  map_chr(outer(1:rows, 1:cols * 1i, "+"), process_square) |>
    matrix(nrow = rows, ncol = cols) |>
    array_branch(1) |>
    map_chr(str_flatten)
}
