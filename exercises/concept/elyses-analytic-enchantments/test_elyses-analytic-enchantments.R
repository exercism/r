source("./elyses-analytic-enchantments.R")
library(testthat)

# does_stack_include_card

test_that("when it is the first card", {
  stack <- c(1, 2, 3)
  card <- 1
  expect_equal(does_stack_include_card(stack, card), TRUE)
})

test_that("when there is a card found", {
  stack <- c(1, 2, 3)
  card <- 4
  expect_equal(does_stack_include_card(stack, card), FALSE)
})

# get_card_position

test_that("when it is the first card", {
  stack <- c(1, 2, 3)
  card <- 1
  expect_equal(get_card_position(stack, card), 1)
})

test_that("when the card is not found", {
  stack <- c(1, 2, 3)
  card <- 4
  expect_equal(get_card_position(stack, card), -1)
})

# is_each_card_even

test_that("when all cards are even", {
  stack <- c(2, 4, 6)
  expect_equal(is_each_card_even(stack), TRUE)
})

test_that("when any card is odd", {
  stack <- c(2, 5, 6)
  expect_equal(is_each_card_even(stack), FALSE)
})

# does_stack_include_odd_card

test_that("should be true if odd number card is found", {
  stack <- c(2, 5, 6)
  expect_equal(does_stack_include_odd_card(stack), TRUE)
})

test_that("should be false if no odd number card is found", {
  stack <- c(2, 4, 6)
  expect_equal(does_stack_include_odd_card(stack), FALSE)
})

# get_first_odd_card

test_that("should return the first odd card found", {
  stack <- c(2, 4, 1, 3)
  expect_equal(get_first_odd_card(stack), 1)
})

test_that("should return -1 if odd card is not found", {
  stack <- c(4, 2, 6)
  expect_equal(get_first_odd_card(stack), -1)
})

# get_first_even_card_position

test_that("should return position of first even card", {
  stack <- c(2, 4, 1, 3)
  expect_equal(get_first_even_card_position(stack), 1)
})

test_that("should return -1 when the card is not found", {
  stack <- c(1, 3, 5)
  expect_equal(get_first_even_card_position(stack), -1)
})
