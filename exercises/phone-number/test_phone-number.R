source("./phone-number.R")
library(testthat)

test_that("cleans the number", {
  expect_equal(parse_phone_number("(123) 456-7890"), "1234567890")
})

test_that("cleans numbers with dots", {
  expect_equal(parse_phone_number("123.456.7890"), "1234567890")
})

test_that("cleans numbers with multiple spaces", {
  expect_equal(parse_phone_number("123 456   7890   "), "1234567890")
})

test_that("invalid when 9 digits", {
  expect_equal(parse_phone_number("123456789"), NULL)
})

test_that("invalid when 11 digits", {
  expect_equal(parse_phone_number("21234567890"), NULL)
})

test_that("valid when 11 digits and starting with 1", {
  expect_equal(parse_phone_number("11234567890"), "1234567890")
})

test_that("invalid when 12 digits", {
  expect_equal(parse_phone_number("321234567890"), NULL)
})

test_that("invalid with letters", {
  expect_equal(parse_phone_number("123-abc-7890"), NULL)
})

test_that("invalid with punctuations", {
  expect_equal(parse_phone_number("123-@:!-7890"), NULL)
})

test_that("invalid with right number of digits but letters mixed in", {
  expect_equal(parse_phone_number("1a2b3c4d5e6f7g8h9i0j"), NULL)
})

print("All tests passed for exercise: phone-number")
