egg_count <- function(display_value) {
  sum(as.integer(intToBits(display_value)))
}
