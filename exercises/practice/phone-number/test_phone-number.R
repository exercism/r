source("./phone-number.R")
library(testthat)

test_that("cleans the number", {
  expect_equal(parse_phone_number("(223) 456-7890"), "2234567890")
})

test_that("cleans numbers with dots", {
  expect_equal(parse_phone_number("223.456.7890"), "2234567890")
})

test_that("cleans numbers with multiple spaces", {
  expect_equal(parse_phone_number("223 456   7890   "), "2234567890")
})

test_that("invalid when 9 digits", {
  expect_equal(parse_phone_number("123456789"), NULL)
})

test_that("invalid when 11 digits and not starting with a 1", {
  expect_equal(parse_phone_number("22234567890"), NULL)
})

test_that("valid when 11 digits and starting with 1", {
  expect_equal(parse_phone_number("12234567890"), "2234567890")
})

test_that("invalid when more than 11 digits", {
  expect_equal(parse_phone_number("321234567890"), NULL)
})

test_that("invalid with letters", {
  expect_equal(parse_phone_number("123-abc-7890"), NULL)
})

test_that("invalid with punctuations", {
  expect_equal(parse_phone_number("123-@:!-7890"), NULL)
})

test_that("invalid if area code does not start with 2-9", {
  expect_equal(parse_phone_number("(123) 456-7890"), NULL)
})

test_that("invalid if exchange code does not start with 2-9", {
  expect_equal(parse_phone_number("(223) 056-7890"), NULL)
})
