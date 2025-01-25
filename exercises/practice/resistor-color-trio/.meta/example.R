colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white") # nolint
units <- c("gigaohms" = 1e9, "megaohms" = 1e6, "kiloohms" = 1e3, "ohms" = 0)

value <- function(resistor_colors) {
  sum((match(resistor_colors[1:2], colors) - 1) * c(10, 1))
}

ohms <- function(resistor_colors) {
  value(resistor_colors) * 10^(match(resistor_colors[3], colors) - 1)
}

label <- function(resistor_colors) {
  resistor_ohms <- ohms(resistor_colors)
  unit_idx <- which.max(resistor_ohms >= units)
  paste(resistor_ohms / 1000^(3:0)[[unit_idx]], names(unit_idx), sep = " ")
}
