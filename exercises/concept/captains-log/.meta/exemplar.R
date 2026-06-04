random_planet_class <- function(number_needed) {
  planetary_classes <- c("D", "H", "J", "K", "L", "M", "N", "R", "T", "Y")
  sample(planetary_classes, number_needed, replace = TRUE)
}

random_ship_registry_number <- function() {
  sprintf("NCC-%d", sample(1000:9999, 1))
}

shuffle_starships <- function(starships) {
  sample(starships)
}

random_stardate <- function() {
  runif(1, min = 41000, max = 42000)
}
