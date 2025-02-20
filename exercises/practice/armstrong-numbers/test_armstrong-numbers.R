source("./armstrong-numbers.R")
library(testthat)

test_that("Zero is an Armstrong number", {
  expect_true(is_armstrong_number(0))
})

test_that("Single-digit numbers are Armstrong numbers", {
  expect_true(is_armstrong_number(5))
})

test_that("There are no two-digit Armstrong numbers", {
  expect_false(is_armstrong_number(10))
})

test_that("Three-digit number that is an Armstrong number", {
  expect_true(is_armstrong_number(153))
})

test_that("Three-digit number that is not an Armstrong number", {
  expect_false(is_armstrong_number(100))
})

test_that("Four-digit number that is an Armstrong number", {
  expect_true(is_armstrong_number(9474))
})

test_that("Four-digit number that is not an Armstrong number", {
  expect_false(is_armstrong_number(9475))
})

test_that("Seven-digit number that is an Armstrong number", {
  expect_true(is_armstrong_number(9926315))
})

test_that("Seven-digit number that is not an Armstrong number", {
  expect_false(is_armstrong_number(9926314))
})
