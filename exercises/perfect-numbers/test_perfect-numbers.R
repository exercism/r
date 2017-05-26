source("./perfect-numbers.R")
library(testthat)

test_that("first perfect number", {
  n <- 6
  expect_equal(isPerfect(n), TRUE)
})

test_that("no perfect number", {
  n <- 8
  expect_equal(isPerfect(n), FALSE)
})

test_that("second perfect number", {
  n <- 28
  expect_equal(isPerfect(n), TRUE)
})

test_that("abundant", {
  n <- 20
  expect_equal(isPerfect(n), FALSE)
})

test_that("answer to the ultimate question of life", {
  n <- 42
  expect_equal(isPerfect(n), FALSE)
})

test_that("third perfect number", {
  n <- 496
  expect_equal(isPerfect(n), TRUE)
})

test_that("odd abundant", {
  n <- 945
  expect_equal(isPerfect(n), FALSE)
})

test_that("fourth perfect number", {
  n <- 8128
  expect_equal(isPerfect(n), TRUE)
})

test_that("fifth perfect number", {
  n <- 33550336
  expect_equal(isPerfect(n), TRUE)
})

test_that("sixth perfect number", {
  n <- 8589869056
  expect_equal(isPerfect(n), TRUE)
})

test_that("seventh perfect number", {
  n <- 137438691328
  expect_equal(isPerfect(n), TRUE)
})

print("All tests passed for exercise: perfect-numbers")
