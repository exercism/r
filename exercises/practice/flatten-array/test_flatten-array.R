source("./flatten-array.R")
library(testthat)

test_that("empty", {
  inputs <- c()
  expected <- c()
  expect_equal(flatten(inputs), expected)
})

test_that("no nesting", {
  inputs <- c(0, 1, 2)
  expected <- c(0, 1, 2)
  expect_equal(flatten(inputs), expected)
})

test_that("flattens a nested array", {
  inputs <- c(c(c()))
  expected <- c()
  expect_equal(flatten(inputs), expected)
})

test_that("flattens array with just integers present", {
  inputs <- c(1, c(2, 3, 4, 5, 6, 7), 8)
  expected <- c(1, 2, 3, 4, 5, 6, 7, 8)
  expect_equal(flatten(inputs), expected)
})

test_that("5 level nesting", {
  inputs <- c(0, 2, c(c(2, 3), 8, 100, 4, c(c(c(50)))), -2)
  expected <- c(0, 2, 2, 3, 8, 100, 4, 50, -2)
  expect_equal(flatten(inputs), expected)
})

test_that("6 level nesting", {
  inputs <- c(1, c(2, c(c(3)), c(4, c(c(5))), 6, 7), 8)
  expected <- c(1, 2, 3, 4, 5, 6, 7, 8)
  expect_equal(flatten(inputs), expected)
})

test_that("null values are omitted from the final result", {
  inputs <- c(1, 2, NULL)
  expected <- c(1, 2)
  expect_equal(flatten(inputs), expected)
})

test_that("consecutive null values at the front of the list are omitted from the final result", { # nolint
  inputs <- c(NULL, NULL, 3)
  expected <- c(3)
  expect_equal(flatten(inputs), expected)
})

test_that("consecutive null values in the middle of the list are omitted from the final result", { # nolint
  inputs <- c(1, NULL, NULL, 4)
  expected <- c(1, 4)
  expect_equal(flatten(inputs), expected)
})

test_that("6 level nest list with null values", {
  inputs <- c(0, 2, c(c(2, 3), 8, c(c(100)), NULL, c(c(NULL))), -2)
  expected <- c(0, 2, 2, 3, 8, 100, -2)
  expect_equal(flatten(inputs), expected)
})

test_that("all values in nested list are null", {
  inputs <- c(NULL, c(c(c(NULL))), NULL, NULL, c(c(NULL, NULL), NULL), NULL)
  expected <- c()
  expect_equal(flatten(inputs), expected)
})
