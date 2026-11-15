# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/sum-of-multiples/canonical-data.json
# File last updated on 2026-11-15

source("./sum-of-multiples.R")
library(testthat)

test_that("no multiples within limit", {
  factors <- c(3, 5)
  limit <- 1
  expect_equal(sum_of_multiples(factors, limit), 0)
})

test_that("one factor has multiples within limit", {
  factors <- c(3, 5)
  limit <- 4
  expect_equal(sum_of_multiples(factors, limit), 3)
})

test_that("more than one multiple within limit", {
  factors <- c(3)
  limit <- 7
  expect_equal(sum_of_multiples(factors, limit), 9)
})

test_that("more than one factor with multiples within limit", {
  factors <- c(3, 5)
  limit <- 10
  expect_equal(sum_of_multiples(factors, limit), 23)
})

test_that("each multiple is only counted once", {
  factors <- c(3, 5)
  limit <- 100
  expect_equal(sum_of_multiples(factors, limit), 2318)
})

test_that("a much larger limit", {
  factors <- c(3, 5)
  limit <- 1000
  expect_equal(sum_of_multiples(factors, limit), 233168)
})

test_that("three factors", {
  factors <- c(7, 13, 17)
  limit <- 20
  expect_equal(sum_of_multiples(factors, limit), 51)
})

test_that("factors not relatively prime", {
  factors <- c(4, 6)
  limit <- 15
  expect_equal(sum_of_multiples(factors, limit), 30)
})

test_that("some pairs of factors relatively prime and some not", {
  factors <- c(5, 6, 8)
  limit <- 150
  expect_equal(sum_of_multiples(factors, limit), 4419)
})

test_that("one factor is a multiple of another", {
  factors <- c(5, 25)
  limit <- 51
  expect_equal(sum_of_multiples(factors, limit), 275)
})

test_that("much larger factors", {
  factors <- c(43, 47)
  limit <- 10000
  expect_equal(sum_of_multiples(factors, limit), 2203160)
})

test_that("all numbers are multiples of 1", {
  factors <- c(1)
  limit <- 100
  expect_equal(sum_of_multiples(factors, limit), 4950)
})

test_that("no factors means an empty sum", {
  factors <- c()
  limit <- 10000
  expect_equal(sum_of_multiples(factors, limit), 0)
})

test_that("the only multiple of 0 is 0", {
  factors <- c(0)
  limit <- 1
  expect_equal(sum_of_multiples(factors, limit), 0)
})

test_that("the factor 0 does not affect the sum of multiples of other factors", {
  factors <- c(3, 0)
  limit <- 4
  expect_equal(sum_of_multiples(factors, limit), 3)
})

test_that("solutions using include-exclude must extend to cardinality greater than 3", {
  factors <- c(2, 3, 5, 7, 11)
  limit <- 10000
  expect_equal(sum_of_multiples(factors, limit), 39614537)
})
