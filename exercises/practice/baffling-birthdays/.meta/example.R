library(tidyverse)

shared_birthday <- function(birthdates) {
  birthdays <- birthdates |> str_sub(6)
  length(birthdays) > length(unique(birthdays))
}

random_birthdates <- function(groupsize) {
  randyear <- sample(1900:year(today()), groupsize, replace = TRUE)
  no_leaps <- if_else(leap_year(randyear), randyear - 1, randyear)
  make_date(year = no_leaps) + days(sample(0:364, groupsize, replace = TRUE))
}

estimate_probability_of_shared_birthday <- function(groupsize) {
  reps <- 500
  runs <- replicate(reps, shared_birthday(random_birthdates(groupsize)))
  sum(runs) / reps
}
