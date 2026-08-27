colors <- c("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")
resistor_bands <- 0:9
names(resistor_bands) <- colors

band_value <- function(band) {
  unname(resistor_bands[band])
}

two_band_value <- function(bands) {
  sum(c(10, 1) * resistor_bands[bands])
}

ohms <- function(bands) {
  two_band_value(bands[1:2]) * 10^band_value(bands[3])
}
