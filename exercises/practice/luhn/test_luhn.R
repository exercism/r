# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/luhn/canonical-data.json
# File last updated on 2026-03-14

source("./luhn.R")
library(testthat)

test_that("single digit strings can not be valid", {
  input <- "1"
  expect_false(is_valid(input))
})

test_that("a single zero is invalid", {
  input <- "0"
  expect_false(is_valid(input))
})

test_that("a simple valid SIN that remains valid if reversed", {
  input <- "059"
  expect_true(is_valid(input))
})

test_that("a simple valid SIN that becomes invalid if reversed", {
  input <- "59"
  expect_true(is_valid(input))
})

test_that("a valid Canadian SIN", {
  input <- "055 444 285"
  expect_true(is_valid(input))
})

test_that("invalid Canadian SIN", {
  input <- "055 444 286"
  expect_false(is_valid(input))
})

test_that("invalid credit card", {
  input <- "8273 1232 7352 0569"
  expect_false(is_valid(input))
})

test_that("invalid long number with an even remainder", {
  input <- "1 2345 6789 1234 5678 9012"
  expect_false(is_valid(input))
})

test_that("invalid long number with a remainder divisible by 5", {
  input <- "1 2345 6789 1234 5678 9013"
  expect_false(is_valid(input))
})

test_that("valid number with an even number of digits", {
  input <- "095 245 88"
  expect_true(is_valid(input))
})

test_that("valid number with an odd number of spaces", {
  input <- "234 567 891 234"
  expect_true(is_valid(input))
})

test_that("valid strings with a non-digit added at the end become invalid", {
  input <- "059a"
  expect_false(is_valid(input))
})

test_that("valid strings with punctuation included become invalid", {
  input <- "055-444-285"
  expect_false(is_valid(input))
})

test_that("valid strings with symbols included become invalid", {
  input <- "055# 444$ 285"
  expect_false(is_valid(input))
})

test_that("single zero with space is invalid", {
  input <- " 0"
  expect_false(is_valid(input))
})

test_that("more than a single zero is valid", {
  input <- "0000 0"
  expect_true(is_valid(input))
})

test_that("input digit 9 is correctly converted to output digit 9", {
  input <- "091"
  expect_true(is_valid(input))
})

test_that("very long input is valid", {
  input <- "9999999999 9999999999 9999999999 9999999999"
  expect_true(is_valid(input))
})

test_that("valid luhn with an odd number of digits and non zero first digit", {
  input <- "109"
  expect_true(is_valid(input))
})

test_that("using ascii value for non-doubled non-digit isn't allowed", {
  input <- "055b 444 285"
  expect_false(is_valid(input))
})

test_that("using ascii value for doubled non-digit isn't allowed", {
  input <- ":9"
  expect_false(is_valid(input))
})

test_that("non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed", {
  input <- "59%59"
  expect_false(is_valid(input))
})
