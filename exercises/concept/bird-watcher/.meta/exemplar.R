today <- function(birds_per_day) {
  tail(birds_per_day, 1)
}

increment_todays_count <- function(birds_per_day) {
  # clunky!
  birds_per_day[length(birds_per_day)] <-
    birds_per_day[length(birds_per_day)] + 1
  birds_per_day
}

has_day_without_birds <- function(birds_per_day) {
  any(birds_per_day == 0)
}

count_for_first_days <- function(birds_per_day, num_days) {
  sum(birds_per_day[1:num_days])
}

busy_days <- function(birds_per_day) {
  length(birds_per_day[birds_per_day >= 5])
}
