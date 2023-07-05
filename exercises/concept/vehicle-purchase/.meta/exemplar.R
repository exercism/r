needs_license <- function(vehicle) {
  vehicle %in% c("car", "truck")
}

choose_vehicle <- function(option1, option2) {
  min(c(option1, option2))
}

calculate_resale_price <- function(original_price, age) {
  if (age < 3) {
    return(0.8 * original_price)
  }
  if (age <= 10) {
    return(0.7 * original_price)
  }
  original_price * 0.5
}
