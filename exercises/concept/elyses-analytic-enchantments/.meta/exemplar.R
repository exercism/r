library(dplyr)

does_stack_include_card <- function(stack, card) {
  card %in% stack
}

get_card_position <- function(stack, card) {
  if_else(does_stack_include_card(stack, card), which(stack == card)[1], -1)
}

is_each_card_even <- function(stack) {
  all(stack %% 2 == 0)
}

does_stack_include_odd_card <- function(stack) {
  !is_each_card_even(stack)
}

get_first_odd_card <- function(stack) {
  if_else(does_stack_include_odd_card(stack), stack[stack %% 2 != 0][1], -1)
}

get_first_even_card_position <- function(stack) {
  if_else(any(stack %% 2 == 0), which(stack %% 2 == 0)[1], -1)
}
