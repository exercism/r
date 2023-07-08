does_stack_include_card <- function(stack, card) {
  card %in% stack
}

get_card_position <- function(stack, card) {
  ifelse(does_stack_include_card(stack, card), which(stack == card), -1)
}

is_each_card_even <- function(stack) {
  all(stack %% 2 == 0)
}

does_stack_include_odd_card <- function(stack) {
  any(stack %% 2 != 0)
}

get_first_odd_card <- function(stack) {
  odds <- stack[stack %% 2 != 0]
  ifelse(length(odds) > 0, odds[1], -1)
}

get_first_even_card_position <- function(stack) {
  even_index <- which(stack %% 2 == 0)
  ifelse(length(even_index) > 0, even_index[1], -1)
}
