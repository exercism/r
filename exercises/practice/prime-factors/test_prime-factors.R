# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/prime-factors/canonical-data.json
# File last updated on 2026-03-14

source("./prime-factors.R")
library(testthat)

test_that("no factors", {
  expect_equal(
    prime_factors(1),
    c()
  )
})

test_that("prime number", {
  expect_equal(
    prime_factors(2),
    c(2)
  )
})

test_that("another prime number", {
  expect_equal(
    prime_factors(3),
    c(3)
  )
})

test_that("square of a prime", {
  expect_equal(
    prime_factors(9),
    c(3, 3)
  )
})

test_that("product of first prime", {
  expect_equal(
    prime_factors(4),
    c(2, 2)
  )
})

test_that("cube of a prime", {
  expect_equal(
    prime_factors(8),
    c(2, 2, 2)
  )
})

test_that("product of second prime", {
  expect_equal(
    prime_factors(27),
    c(3, 3, 3)
  )
})

test_that("product of third prime", {
  expect_equal(
    prime_factors(625),
    c(5, 5, 5, 5)
  )
})

test_that("product of first and second prime", {
  expect_equal(
    prime_factors(6),
    c(2, 3)
  )
})

test_that("product of primes and non-primes", {
  expect_equal(
    prime_factors(12),
    c(2, 2, 3)
  )
})

test_that("product of primes", {
  expect_equal(
    prime_factors(901255),
    c(5, 17, 23, 461)
  )
})

test_that("factors include a large prime", {
  expect_equal(
    prime_factors(93819012551),
    c(11, 9539, 894119)
  )
})
