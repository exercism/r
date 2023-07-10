random_planet <- function() {
  planetary_classes <- c("D", "H", "J", "K", "L", "M", "N", "R", "T", "Y")
  sample(planetary_classes, 1)
}

random_ship_registry_number <- function() {
  sprintf("NCC-%d", sample(1000:9999, 1))
}

random_stardate <- function() {
  runif(1, min = 41000, max = 42000)
}
