# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/darts/canonical-data.json
# File last updated on 2026-03-19

source("./darts.R")
library(testthat)

test_that("Missed target", {
  x <- -9
  y <- 9
  expect_equal(score(x, y), 0)
})

test_that("On the outer circle", {
  x <- 0
  y <- 10
  expect_equal(score(x, y), 1)
})

test_that("On the middle circle", {
  x <- -5
  y <- 0
  expect_equal(score(x, y), 5)
})

test_that("On the inner circle", {
  x <- 0
  y <- -1
  expect_equal(score(x, y), 10)
})

test_that("Exactly on center", {
  x <- 0
  y <- 0
  expect_equal(score(x, y), 10)
})

test_that("Near the center", {
  x <- -0.1
  y <- -0.1
  expect_equal(score(x, y), 10)
})

test_that("Just within the inner circle", {
  x <- 0.7
  y <- 0.7
  expect_equal(score(x, y), 10)
})

test_that("Just outside the inner circle", {
  x <- 0.8
  y <- -0.8
  expect_equal(score(x, y), 5)
})

test_that("Just within the middle circle", {
  x <- -3.5
  y <- 3.5
  expect_equal(score(x, y), 5)
})

test_that("Just outside the middle circle", {
  x <- -3.6
  y <- -3.6
  expect_equal(score(x, y), 1)
})

test_that("Just within the outer circle", {
  x <- -7.0
  y <- 7.0
  expect_equal(score(x, y), 1)
})

test_that("Just outside the outer circle", {
  x <- 7.1
  y <- -7.1
  expect_equal(score(x, y), 0)
})

test_that("Asymmetric position between the inner and middle circles", {
  x <- 0.5
  y <- -4
  expect_equal(score(x, y), 5)
})
