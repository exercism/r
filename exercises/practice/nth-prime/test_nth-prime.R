# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/nth-prime/canonical-data.json
# File last updated on 2026-11-15

source("./nth-prime.R")
library(testthat)

test_that("first prime", {
  expect_equal(prime(1), 2)
})

test_that("second prime", {
  expect_equal(prime(2), 3)
})

test_that("sixth prime", {
  expect_equal(prime(6), 13)
})

test_that("big prime", {
  expect_equal(prime(10001), 104743)
})

test_that("there is no zeroth prime", {
  expect_error(prime(0))
})
