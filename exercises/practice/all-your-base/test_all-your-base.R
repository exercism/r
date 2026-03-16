# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/all-your-base/canonical-data.json
# File last updated on 2026-03-16

source("./all-your-base.R")
library(testthat)

test_that("single bit one to decimal", {
  input_base <- 2
  digits <- c(1)
  output_base <- 10
  expect_equal(
    rebase(input_base, digits, output_base),
    c(1)
  )
})

test_that("binary to single decimal", {
  input_base <- 2
  digits <- c(1, 0, 1)
  output_base <- 10
  expect_equal(
    rebase(input_base, digits, output_base),
    c(5)
  )
})

test_that("single decimal to binary", {
  input_base <- 10
  digits <- c(5)
  output_base <- 2
  expect_equal(
    rebase(input_base, digits, output_base),
    c(1, 0, 1)
  )
})

test_that("binary to multiple decimal", {
  input_base <- 2
  digits <- c(1, 0, 1, 0, 1, 0)
  output_base <- 10
  expect_equal(
    rebase(input_base, digits, output_base),
    c(4, 2)
  )
})

test_that("decimal to binary", {
  input_base <- 10
  digits <- c(4, 2)
  output_base <- 2
  expect_equal(
    rebase(input_base, digits, output_base),
    c(1, 0, 1, 0, 1, 0)
  )
})

test_that("trinary to hexadecimal", {
  input_base <- 3
  digits <- c(1, 1, 2, 0)
  output_base <- 16
  expect_equal(
    rebase(input_base, digits, output_base),
    c(2, 10)
  )
})

test_that("hexadecimal to trinary", {
  input_base <- 16
  digits <- c(2, 10)
  output_base <- 3
  expect_equal(
    rebase(input_base, digits, output_base),
    c(1, 1, 2, 0)
  )
})

test_that("15-bit integer", {
  input_base <- 97
  digits <- c(3, 46, 60)
  output_base <- 73
  expect_equal(
    rebase(input_base, digits, output_base),
    c(6, 10, 45)
  )
})

test_that("empty list", {
  input_base <- 2
  digits <- c()
  output_base <- 10
  expect_equal(
    rebase(input_base, digits, output_base),
    c(0)
  )
})

test_that("single zero", {
  input_base <- 10
  digits <- c(0)
  output_base <- 2
  expect_equal(
    rebase(input_base, digits, output_base),
    c(0)
  )
})

test_that("multiple zeros", {
  input_base <- 10
  digits <- c(0, 0, 0)
  output_base <- 2
  expect_equal(
    rebase(input_base, digits, output_base),
    c(0)
  )
})

test_that("leading zeros", {
  input_base <- 7
  digits <- c(0, 6, 0)
  output_base <- 10
  expect_equal(
    rebase(input_base, digits, output_base),
    c(4, 2)
  )
})

test_that("input base is one", {
  input_base <- 1
  digits <- c(0)
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("input base is zero", {
  input_base <- 0
  digits <- c()
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("input base is negative", {
  input_base <- -2
  digits <- c(1)
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})

test_that("negative digit", {
  input_base <- 2
  digits <- c(1, -1, 1, 0, 1, 0)
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "all digits must satisfy 0 <= d < input base"
  )
})

test_that("invalid positive digit", {
  input_base <- 2
  digits <- c(1, 2, 1, 0, 1, 0)
  output_base <- 10
  expect_error(
    rebase(input_base, digits, output_base),
    "all digits must satisfy 0 <= d < input base"
  )
})

test_that("output base is one", {
  input_base <- 2
  digits <- c(1, 0, 1, 0, 1, 0)
  output_base <- 1
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("output base is zero", {
  input_base <- 10
  digits <- c(7)
  output_base <- 0
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("output base is negative", {
  input_base <- 2
  digits <- c(1)
  output_base <- -7
  expect_error(
    rebase(input_base, digits, output_base),
    "output base must be >= 2"
  )
})

test_that("both bases are negative", {
  input_base <- -2
  digits <- c(1)
  output_base <- -7
  expect_error(
    rebase(input_base, digits, output_base),
    "input base must be >= 2"
  )
})
