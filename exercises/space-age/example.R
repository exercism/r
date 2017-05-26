space_age <- function(seconds, planet) {
  
  # number of seconds
  earth_year <- 31557600
  
  conversion <- list(mercury = 0.2408467 * earth_year,
                     venus = 0.61519726 * earth_year,
                     earth = 1 * earth_year,
                     mars = 1.8808158 * earth_year,
                     jupiter = 11.862615 * earth_year,
                     saturn = 29.447498 * earth_year,
                     uranus = 84.016846 * earth_year,
                     neptune = 164.79132 * earth_year)
  
  round(seconds / conversion[planet][[1]], 2)
  
}
