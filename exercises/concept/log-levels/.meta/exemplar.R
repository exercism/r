# Aiming to solve this early concept exercise without regex knowledge
# or access to stringr
#
# Makes me understand why stringr is so popular!

split_msg <- function(msg) {
  strsplit(msg, ": ")[[1]]
}

message <- function(msg) {
  trimws(split_msg(msg)[2])
}

log_level <- function(msg) {
  raw <- tolower(split_msg(msg)[1])
  len <- nchar(raw)
  substr(raw, 2, len - 1)
}

reformat <- function(msg) {
  paste(message(msg), " (", log_level(msg), ")", sep = "")
}
