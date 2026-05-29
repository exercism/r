library(stringr)

valid <- regex("chatbot", ignore_case = TRUE)
emoji <- "emoji[0-9]+"
phone <- r"-{^\(\+?([0-9]{2})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{3})[-. ]?([0-9]{3})$}-"
url   <- "(\\w+\\.\\w+)"
names <- "(\\w+), (\\w+)"

is_valid_command <- function(msg) {
  msg |> str_starts(valid)
}

remove_emoji <- function(msg) {
  msg |> str_remove_all(emoji)
}

check_phone_number <- function(number) {
  ifelse(str_detect(number, phone),
         "Thanks! You can now download me to your phone.",
         str_glue("Oops, it seems like I can't reach out to {number}"))
}

nice_to_meet_you <- function(str) {
  name <- str_replace(str, names, "\\2 \\1")
  str_glue("Nice to meet you, {name}")
}

get_URL <- function(msg) {
  m <- str_match_all(msg, url)[[1]]
  m[, 2]
}
