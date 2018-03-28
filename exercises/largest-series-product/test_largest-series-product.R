source("./largest-series-product.R")
library(testthat)

context("largest series product")

test_that("finds the largest product if span equals length", {
  digits <- "29"
  span <- 2
  expect_equal(largest_series_product(digits, span), 18)
})

test_that("can find the largest product of 2 with numbers in order", {
  digits <- "0123456789"
  span <- 2
  expect_equal(largest_series_product(digits, span), 72)
})

test_that("can find the largest product of 2", {
  digits <- "576802143"
  span <- 2
  expect_equal(largest_series_product(digits, span), 48)
})

test_that("can find the largest product of 3 with numbers in order", {
  digits <- "0123456789"
  span <- 3
  expect_equal(largest_series_product(digits, span), 504)
})

test_that("can find the largest product of 3", {
  digits <- "1027839564"
  span <- 3
  expect_equal(largest_series_product(digits, span), 270)
})

test_that("can find the largest product of 5 with numbers in order", {
  digits <- "0123456789"
  span <- 5
  expect_equal(largest_series_product(digits, span), 15120)
})

test_that("can get the largest product of a big number", {
  digits <- "73167176531330624919225119674426574742355349194934"
  span <- 6
  expect_equal(largest_series_product(digits, span), 23520)
})

test_that("reports zero if the only digits are zero", {
  digits <- "0000"
  span <- 2
  expect_equal(largest_series_product(digits, span), 0)
})

test_that("reports zero if all spans include zero", {
  digits <- "99099"
  span <- 3
  expect_equal(largest_series_product(digits, span), 0)
})

test_that("rejects span longer than string length", {
  digits <- "123"
  span <- 4
  expect_error(largest_series_product(digits, span))
})

# There may be some confusion about whether this should be 1 or error.
# The reasoning for it being 1 is this:
#   There is one 0-character string contained in the empty string.
#   That's the empty string itself.
#   The empty product is 1 (the identity for multiplication).
#   Therefore LSP("", 0) is 1.
#   It's NOT the case that LSP("", 0) takes max of an empty list.
#   So there is no error.
# Compare against LSP("123", 4):
#   There are zero 4-character strings in "123".
#   So LSP("123", 4) really DOES take the max of an empty list.
#   So LSP("123", 4) errors and LSP("", 0) does NOT.

test_that("reports 1 for empty string and empty product (0 span)", {
  digits <- ""
  span <- 0
  expect_equal(largest_series_product(digits, span), 1)
})

# As above, there is one 0-character string in "123".
# So again no error. It's the empty product, 1.

test_that("reports 1 for nonempty string and empty product (0 span)", {
  digits <- "123"
  span <- 0
  expect_equal(largest_series_product(digits, span), 1)
})

test_that("rejects empty string and nonzero span", {
  digits <- ""
  span <- 1
  expect_error(largest_series_product(digits, span))
})

test_that("rejects invalid character in digits", {
  digits <- "1234a5"
  span <- 2
  expect_error(largest_series_product(digits, span))
})

test_that("rejects negative span", {
  digits <- "12345"
  span <- -1
  expect_error(largest_series_product(digits, span))
})

message("All tests passed for exercise: largest-series-product")
