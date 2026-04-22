library(lubridate)
library(stringr)

day_abbrevs <- c("Sun" = 1, "Mon" = 2, "Tue" = 3, "Wed" = 4,
                 "Thu" = 5, "Fri" = 6, "Sat" = 7)
week_specifiers <- c("first" = 1, "second" = 2, "third" = 3,
                     "fourth" = 4, "fifth" = 5)

meetup <- function(year, month, week, day_of_week) {
  curr_month <- make_date(year, month)
  days <- make_date(year, month, 1:days_in_month(curr_month))
  num_dow <- day_abbrevs[str_sub(day_of_week, 1, 3)]
  valid_dates <- days[wday(days) == num_dow]

  if (week %in% names(week_specifiers) &&
        length(valid_dates) >= week_specifiers[week]) {
    result <- valid_dates[week_specifiers[week]]
  } else if (week == "last") {
    result <- max(valid_dates)
  } else if (week == "teenth") {
    teenth <- valid_dates[day(valid_dates) %in% 13:19]
    result <- teenth
  } else {
    stop("Invalid input")
  }

  result |> as.character()
}
