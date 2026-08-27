# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/grains/canonical-data.json
# File last updated on 2026-03-20

source("./grains.R")
library(testthat)

test_that("grains on square 1", {
  input <- 1
  expected <- 1
  expect_equal(square(input), expected)
})

test_that("grains on square 2", {
  input <- 2
  expected <- 2
  expect_equal(square(input), expected)
})

test_that("grains on square 3", {
  input <- 3
  expected <- 4
  expect_equal(square(input), expected)
})

test_that("grains on square 4", {
  input <- 4
  expected <- 8
  expect_equal(square(input), expected)
})

test_that("grains on square 16", {
  input <- 16
  expected <- 32768
  expect_equal(square(input), expected)
})

test_that("grains on square 32", {
  input <- 32
  expected <- 2147483648
  expect_equal(square(input), expected)
})

test_that("grains on square 64", {
  input <- 64
  expected <- 9223372036854775808
  expect_equal(square(input), expected)
})

test_that("square 0 is invalid", {
  input <- 0
  expect_error(square(input))
})

test_that("negative square is invalid", {
  input <- -1
  expect_error(square(input))
})

test_that("square greater than 64 is invalid", {
  input <- 65
  expect_error(square(input))
})

test_that("returns the total number of grains on the board", {
  expect_equal(total(), 18446744073709551615)
})
