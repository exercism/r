source("./luhn.R")
library(testthat)

test_that("single digit strings can not be valid", {
  input <- "1"
  expect_false(is_valid(input))
})

test_that("A single zero is invalid", {
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

test_that("valid Canadian SIN", {
  input <- "046 454 286"
  expect_true(is_valid(input))
})

test_that("invalid Canadian SIN", {
  input <- "046 454 287"
  expect_false(is_valid(input))
})

test_that("invalid credit card", {
  input <- "8273 1232 7352 0569"
  expect_false(is_valid(input))
})

test_that("valid strings with a non-digit added become invalid", {
  input <- "055a 444 285"
  expect_false(is_valid(input))
})

test_that("punctuation is not allowed", {
  input <- "055-444-285"
  expect_false(is_valid(input))
})

test_that("symbols are not allowed", {
  input <- "055£ 444$ 285"
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

test_that("another valid sin", {
  input <- "055 444 285"
  expect_true(is_valid(input))
})

test_that("nine doubled is nine", {
  input <- "091"
  expect_true(is_valid(input))
})
