source("./collatz-conjecture.R")
library(testthat)

test_that("Input of one results in zero steps", {
  expect_equal(collatz_step_counter(1), 0)
})

test_that("Even input with repeated even steps", {
  expect_equal(collatz_step_counter(16), 4)
})

test_that("Input which results in small number of even and odd steps", {
  expect_equal(collatz_step_counter(12), 9)
})

test_that("Input which results in large number of even and odd steps", {
  expect_equal(collatz_step_counter(1000000), 152)
})

test_that("Input of zero results in an error", {
  expect_error(collatz_step_counter(0))
})

test_that("Negative input results in an error", {
  expect_error(collatz_step_counter(-15))
})

message("All tests passed for exercise: collatz-conjecture")
