# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/square-root/canonical-data.json
# File last updated on 2026-11-15

source("./square-root.R")
library(testthat)

test_that("root of 1", {
  expect_equal(square_root(1), 1)
})

test_that("root of 4", {
  expect_equal(square_root(4), 2)
})

test_that("root of 25", {
  expect_equal(square_root(25), 5)
})

test_that("root of 81", {
  expect_equal(square_root(81), 9)
})

test_that("root of 196", {
  expect_equal(square_root(196), 14)
})

test_that("root of 65025", {
  expect_equal(square_root(65025), 255)
})

# Additional tests for this track

test_that("domain error for negative number", {
  expect_error(square_root(-65536))
})
