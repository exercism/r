library(lubridate)
library(stringr)

delivery_date <- function(start, description) {
  start_dt <- ymd_hms(start)
  start_day <- as_date(start_dt)
  # we want Monday = 1, wday() returns Sunday = 1 by default
  day_of_week <- wday(start_dt, week_start = 1)

  if (description == "NOW") {
    result <- start_dt + hours(2L)
  } else if (description == "ASAP") {
    result <- ifelse(start_dt < (start_day + hours(13L)),
      start_day + hours(17L),
      start_day + days(1) + hours(13L)
    )
  } else if (description == "EOW") {
    result <- ifelse(day_of_week <= 3L,
      start_day + days(5 - day_of_week) + hours(17L),
      start_day + days(7 - day_of_week) + hours(20L)
    )
  } else if (str_sub(description, -1) == "M") {
    m <- description |>
      str_sub(1, -2) |>
      as.integer()
    y <- ifelse(month(start_dt) >= m, year(start_dt) + 1, year(start_dt))
    target <- make_datetime(y, m, 1, 8)
    target_wday <- wday(target, week_start = 1)
    result <- ifelse(target_wday <= 5, target, target + days(8 - target_wday))
  } else if (str_sub(description, 1, 1) == "Q") {
    q <- description |>
      str_sub(2, -1) |>
      as.integer()
    current_q <- quarter(start_dt)
    m <- (3 * q + 1) %% 12
    rollover <- ifelse(current_q > q || q == 4, 1, 0)

    due <- make_datetime(year(start_dt) + rollover, m, 1, 8) - days(1L)
    due_wday <- wday(due, week_start = 1)
    result <- ifelse(due_wday <= 5, due, due - days(due_wday - 5))
  } else {
    stop("Invalid input")
  }

  result |>
    as_datetime() |>
    format_ISO8601()
}
