source("./palindrome-products.R")
library(testthat)


test_that('find the smallest palindrome from single digit factors', {
  input <- list(min = 1, max = 9)
  actual <- palindrome_products(input)$smallest
  expect_equal(actual$value, 1)
  expect_equal(actual$factors, list(c(1, 1)))
})

test_that('find the largest palindrome from single digit factors', {
  # skip()
  input <- list(min = 1, max = 9)
  actual <- palindrome_products(input)$largest
  expect_equal(actual$value, 9)
  expect_equal(actual$factors, list(c(1, 9), c(3, 3)))
})

test_that('find the smallest palindrome from double digit factors', {
  input <- list(min = 10, max = 99)
  actual <- palindrome_products(input)$smallest
  expect_equal(actual$value, 121)
  expect_equal(actual$factors, list(c(11, 11)))
})

test_that('find the largest palindrome from double digit factors', {
  input <- list(min = 10, max = 99)
  actual <- palindrome_products(input)$largest
  expect_equal(actual$value, 9009)
  expect_equal(actual$factors, list(c(91, 99)))
})

test_that('find the largest palindrome from triple digit factors', {
  input <- list(min = 100, max = 999)
  actual <- palindrome_products(input)$largest
  expect_equal(actual$value, 906609)
  expect_equal(actual$factors, list(c(913, 993)))
})

test_that('find the smallest palindrome from four digit factors', {
  input <- list(min = 1000, max = 9999)
  actual <- palindrome_products(input)$smallest
  expect_equal(actual$value, 1002001)
  expect_equal(actual$factors, list(c(1001, 1001)))
})

test_that('find the largest palindrome from four digit factors', {
  input <- list(min = 1000, max = 9999)
  actual <- palindrome_products(input)$largest
  expect_equal(actual$value, 99000099)
  expect_equal(actual$factors, list(c(9901, 9999)))
})

test_that('empty result for smallest if no palindrome in the range', {
  input <- list(min = 1002, max = 1003)
  actual <- palindrome_products(input)$smallest
  expect_null(actual$value)
  expect_length(actual$factors, 0)
})

test_that('empty result for largest if no palindrome in the range', {
  # skip()
  input <- list(min = 15, max = 15)
  actual <- palindrome_products(input)$largest
  expect_null(actual$value)
  expect_length(actual$factors, 0)
})

test_that('error result if min is more than max', {
  input <- list(min = 10000, max = 1)
  expect_error(palindrome_products(input))
})

test_that('smallest product does not use the smallest factor', {
  input <- list(min = 3215, max = 4000)
  actual <- palindrome_products(input)$smallest
  expect_equal(actual$value, 10988901)
  expect_equal(actual$factors, list(c(3297, 3333)))
})

test_that('arbitrary range within five digit numbers', {
  input <- list(min = 33740, max = 58504)
  actual <- palindrome_products(input)$largest
  expect_equal(actual$value, 3401441043)
  expect_equal(actual$factors, list(c(58201, 58443)))
})
