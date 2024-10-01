maximum_value <- function(max_wt, items) {
  # This URL is > 80 chars, ignore whining from the linter:
  # https://en.wikipedia.org/wiki/Knapsack_problem#Dynamic_programming_in-advance_algorithm

  num_items <- length(items)
  if (num_items == 0) return(0)

  # Remember, Julia uses 1-based array indexing
  # so maxes[r,c] indexing needs to be r+1, c+1, compared to the Wiki reference

  maxes <- matrix(0, nrow = num_items + 1, ncol = max_wt + 1)
  for (item in 1:num_items) {
    for (weight in 1:max_wt) {
      curr_wt <- items[[item]]$weight
      if (curr_wt > weight) {
        # copy the row above, the new item is no use to us
        maxes[item + 1, weight + 1] <- maxes[item, weight + 1]
      } else {
        # perhaps drop an old item, add the new one?
        drop_last <- maxes[item, weight - curr_wt + 1] + items[[item]]$value
        maxes[item + 1, weight + 1] <- max(maxes[item, weight + 1], drop_last)
      }
    }
  }
  # maxes[nrow(maxes), ncol(maxes)]
  # shorter way to get the bottom-right element:
  tail(c(maxes), 1)
}
