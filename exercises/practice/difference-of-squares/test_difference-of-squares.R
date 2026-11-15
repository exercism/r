# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/difference-of-squares/canonical-data.json
# File last updated on 2026-11-15

source("./difference-of-squares.R")
library(testthat)

test_that("difference of squares 1", {
  input <- 1
  expect_equal(difference_of_squares(input), 0)
})

test_that("difference of squares 5", {
  input <- 5
  expect_equal(difference_of_squares(input), 170)
})

test_that("difference of squares 100", {
  input <- 100
  expect_equal(difference_of_squares(input), 25164150)
})

# Additional tests for this track

test_that("difference of squares 0", {
  input <- 0
  expect_equal(difference_of_squares(input), 0)
})
