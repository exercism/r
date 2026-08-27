source("./lasagna.R")
library(testthat)

test_that("1. Expected minutes in the oven", {
  expect_equal(expected_minutes_in_oven(), 60)
})

test_that("2. Remaining minutes in the oven", {
  expect_equal(remaining_time_in_minutes(25), 35)
})

test_that("3. Preparation time in minutes for 1 layer", {
  expect_equal(prep_time_in_minutes(1), 2)
})

test_that("3. Preparation time in minutes for multiple layers", {
  expect_equal(prep_time_in_minutes(4), 8)
})

test_that("4. Elapsed time in minutes for 1 layer", {
  expect_equal(elapsed_time_in_minutes(1, 30), 32)
})

test_that("4. Elapsed time in minutes for multiple layers", {
  expect_equal(elapsed_time_in_minutes(4, 8), 16)
})
