library(stringr)

get_number <- function(num, lower = FALSE) {
  values <- c("No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
  val <- values[num + 1]
  ifelse(lower, str_to_lower(val), val)
}

recite <- function(start_bottles, take_down) {
  sequence(take_down, start_bottles, by = -1) |>
    sapply(verse) |>
    str_flatten(collapse = "\n\n")
}

main_verse <- function(num) {
  count <- get_number(num)
  bottles <- ifelse(num == 1, 'bottle', 'bottles')
  "{count} green {bottles} hanging on the wall," |>
    str_glue() |>
    str_dup(2, sep = "\n")
}

last_verse <- function(num) {
  count <- get_number(num, TRUE)
  bottles <- ifelse(num == 1, 'bottle', 'bottles')
  str_glue("There'll be {count} green {bottles} hanging on the wall.")
}

verse <- function(num) {
  str_flatten(c(
    main_verse(num),
    "And if one green bottle should accidentally fall,",
    last_verse(num - 1)
  ), 
  collapse = "\n")
}
