source("./luhn.R")
library(testthat)

test_that("single digit strings can not be valid", {
  input <- "1"
  expect_equal(is_valid(input), FALSE)
})

test_that("A single zero is invalid", {
  input <- "0"
  expect_equal(is_valid(input), FALSE)
})

test_that("simple valid sin", {
  input <- " 5 9 "
  expect_equal(is_valid(input), TRUE)
})

test_that("valid Canadian SIN", {
  input <- "046 454 286"
  expect_equal(is_valid(input), TRUE)
})

test_that("invalid Canadian SIN", {
  input <- "046 454 287"
  expect_equal(is_valid(input), FALSE)
})

test_that("invalid credit card", {
  input <- "8273 1232 7352 0569"
  expect_equal(is_valid(input), FALSE)
})

test_that("valid strings with a non-digit added become invalid", {
  input <- "046a 454 286"
  expect_equal(is_valid(input), FALSE)
})

test_that("punctuation is not allowed", {
  input <- "055-444-285"
  expect_equal(is_valid(input), FALSE)
})

test_that("symbols are not allowed", {
  input <- "055£ 444$ 285"
  expect_equal(is_valid(input), FALSE)
})

test_that("single zero with space is invalid", {
  input <- " 0"
  expect_equal(is_valid(input), FALSE)
})

test_that("lots of zeros are valid", {
  input <- " 00000"
  expect_equal(is_valid(input), TRUE)
})

test_that("another valid sin", {
  input <- "055 444 285"
  expect_equal(is_valid(input), TRUE)
})

test_that("nine doubled is nine", {
  input <- "091"
  expect_equal(is_valid(input), TRUE)
})

print("All tests passed for exercise: luhn")
