source("./collatz-conjecture.R")
library(testthat)

test_that("zero steps for one", {
  expect_equal(collatz_step_counter(1), 0)
})

test_that("divide if even", {
  expect_equal(collatz_step_counter(16), 4)
})

test_that("even and odd steps", {
  expect_equal(collatz_step_counter(12), 9)
})

test_that("Large number of even and odd steps", {
  expect_equal(collatz_step_counter(1000000), 152)
})

test_that("zero is an error", {
  expect_error(collatz_step_counter(0))
})

test_that("negative value is an error", {
  expect_error(collatz_step_counter(-15))
})

message("All tests passed for exercise: collatz-conjecture")
