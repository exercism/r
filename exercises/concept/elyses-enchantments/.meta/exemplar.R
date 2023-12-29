get_item <- function(stack, position) {
  stack[position]
}

set_item <- function(stack, position, replacement_card) {
  stack[position] <- replacement_card
  stack
}

insert_item_at_top <- function(stack, new_card) {
  c(stack, new_card)
}

remove_item <- function(stack, position) {
  stack[-position]
}

remove_item_from_top <- function(stack) {
  len <- length(stack)
  if (len > 1) {
    return(stack[-len])
  }
  NULL
}

insert_item_at_bottom <- function(stack, new_card) {
  c(new_card, stack)
}

remove_item_at_bottom <- function(stack) {
  if (length(stack) > 1) {
    return(stack[-1])
  }
  NULL
}

check_size_of_stack <- function(stack, stack_size) {
  length(stack) == stack_size
}
