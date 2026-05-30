library(tidyverse)

schedule_appointment <- function(appointment) {
  mdy_hms(appointment)
}

has_passed <- function(appointment) {
  appointment < now("UTC")
}

is_afternoon_appointment <- function(appointment) {
  hour(appointment) >= 12 && hour(appointment) < 18
}

describe <- function(appointment) {
  # Base R approach
#   fmt <- "You have an appointment on %A, %B %d, %Y at %H:%M"
#   format(appointment, fmt)
  
  # lubridate approach
  template <- "You have an appointment on Saturday, January 30, 2026 at 13:25"
  sf <- stamp(template, locale = "C")
  sf(appointment)
}

anniversary_date <- function() {
  make_date(year(today()), 9, 15)
}
