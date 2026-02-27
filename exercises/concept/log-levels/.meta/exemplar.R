# Aiming to solve this early concept exercise without regex knowledge

# First solution sticks to base R

# split_msg <- function(msg) {
#   strsplit(msg, ": ")[[1]]
# }

# message <- function(msg) {
#   trimws(split_msg(msg)[2])
# }

# log_level <- function(msg) {
#   raw <- tolower(split_msg(msg)[1])
#   len <- nchar(raw)
#   substr(raw, 2, len - 1)
# }

# reformat <- function(msg) {
#   paste(message(msg), " (", log_level(msg), ")", sep = "")
# }

# Second solution makes me understand why stringr is so popular!

library(stringr)

split_msg <- function(msg) {
  str_split_1(msg, ": ")
}

message <- function(msg) {
  split_msg(msg)[2] |> str_trim()
}

log_level <- function(msg) {
  split_msg(msg)[1] |>
    str_to_lower() |>
    str_sub(2, -2)
}

reformat <- function(msg) {
  str_glue("{message(msg)} ({log_level(msg)})")
}
