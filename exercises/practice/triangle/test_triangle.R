# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/triangle/canonical-data.json
# File last updated on 2026-03-14

source("./triangle.R")
library(testthat)


# equilateral triangle

test_that("all sides are equal", {
  side <- c(2, 2, 2)
  expect_true("equilateral" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("any side is unequal", {
  side <- c(2, 3, 2)
  expect_false("equilateral" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("no sides are equal", {
  side <- c(5, 4, 6)
  expect_false("equilateral" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("all zero sides is not a triangle", {
  side <- c(0, 0, 0)
  expect_error(triangle(side[1], side[2], side[3]))
})

test_that("sides may be floats", {
  side <- c(0.5, 0.5, 0.5)
  expect_true("equilateral" %in% class(triangle(side[1], side[2], side[3])))
})


# isosceles triangle

test_that("last two sides are equal", {
  side <- c(3, 4, 4)
  expect_true("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("first two sides are equal", {
  side <- c(4, 4, 3)
  expect_true("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("first and last sides are equal", {
  side <- c(4, 3, 4)
  expect_true("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("equilateral triangles are also isosceles", {
  side <- c(4, 4, 4)
  expect_true("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("no sides are equal", {
  side <- c(2, 3, 4)
  expect_false("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("first triangle inequality violation", {
  side <- c(1, 1, 3)
  expect_error(triangle(side[1], side[2], side[3]))
})

test_that("second triangle inequality violation", {
  side <- c(1, 3, 1)
  expect_error(triangle(side[1], side[2], side[3]))
})

test_that("third triangle inequality violation", {
  side <- c(3, 1, 1)
  expect_error(triangle(side[1], side[2], side[3]))
})

test_that("sides may be floats", {
  side <- c(0.5, 0.4, 0.5)
  expect_true("isosceles" %in% class(triangle(side[1], side[2], side[3])))
})


# scalene triangle

test_that("no sides are equal", {
  side <- c(5, 4, 6)
  expect_true("scalene" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("all sides are equal", {
  side <- c(4, 4, 4)
  expect_false("scalene" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("first and second sides are equal", {
  side <- c(4, 4, 3)
  expect_false("scalene" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("first and third sides are equal", {
  side <- c(3, 4, 3)
  expect_false("scalene" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("second and third sides are equal", {
  side <- c(4, 3, 3)
  expect_false("scalene" %in% class(triangle(side[1], side[2], side[3])))
})

test_that("may not violate triangle inequality", {
  side <- c(7, 3, 2)
  expect_error(triangle(side[1], side[2], side[3]))
})

test_that("sides may be floats", {
  side <- c(0.5, 0.4, 0.6)
  expect_true("scalene" %in% class(triangle(side[1], side[2], side[3])))
})
