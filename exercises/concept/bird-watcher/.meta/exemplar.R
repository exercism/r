today <- function(birds_per_day) {
  tail(birds_per_day, 1)
}

increment_todays_count <- function(birds_per_day) {
  birds_per_day + c(rep(0, 6), 1)
}

has_day_without_birds <- function(birds_per_day) {
  any(birds_per_day == 0)
}

count_for_first_days <- function(birds_per_day, num_days) {
  sum(birds_per_day[1:num_days])
}

busy_days <- function(birds_per_day) {
  birds_per_day[birds_per_day >= 5] |> length()
}

running_total <- function(birds_per_day) {
  cumsum(birds_per_day)
}

busy_days_of_week <- function(birds_per_day, day_names) {
  day_names[order(birds_per_day, decreasing = TRUE)]
}
