# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/collatz-conjecture/canonical-data.json
# File last updated on 2026-03-11

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
test_that("large number of even and odd steps", {
  expect_equal(collatz_step_counter(1000000), 152)
})
test_that("zero is an error", {
  expect_error(collatz_step_counter(0))
})
test_that("negative value is an error", {
  expect_error(collatz_step_counter(-15))
})


# Additional tests for this track

test_that("answer can accept vector parameter", {
  expect_equal(collatz_step_counter(c(1, 16, 12, 1000000)), c(0, 4, 9, 152))
})
