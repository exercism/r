# Here, clock is implemented as a list, but there are other options
# The tests ignore implementation details and only check the display string

create <- function(hours, minutes) {
  total_minutes <- hours * 60 + minutes
  normalized_hours <- (total_minutes %/% 60) %% 24
  normalized_minutes <- total_minutes %% 60
  list(hours = normalized_hours, minutes = normalized_minutes)
}

add <- function(clock, minutes) {
  create(clock$hours, clock$minutes + minutes)
}

subtract <- function(clock, minutes) {
  create(clock$hours, clock$minutes - minutes)
}

display <- function(clock) {
  sprintf("%02d:%02d", clock$hours, clock$minutes)
}

equal <- function(clock1, clock2) {
  clock1$hours == clock2$hours && clock1$minutes == clock2$minutes
}
