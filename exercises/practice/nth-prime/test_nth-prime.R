source("./nth-prime.R")
library(testthat)

context("nth-prime")

test_that("first prime", {
  n <- 1
  expect_equal(prime(n), 2)
})

test_that("second prime", {
  n <- 2
  expect_equal(prime(n), 3)
})

test_that("sixth prime", {
  n <- 6
  expect_equal(prime(n), 13)
})

test_that("big prime", {
  n <- 10001
  expect_equal(prime(n), 104743)
})

test_that("there is no zeroth prime", {
  n <- 0
  expect_error(prime(n))
})


message("All tests passed for exercise: luhn")
