source("./coordinate-transformation.R")
library(testthat)

# move

test_that("1. translated coordinates, with deltas", {
  expect_equal(move(4, 3, 0.5, 1), c(4.5, 4))
  expect_equal(move(11, -2.3, -0.7, 3.1), c(10.3, 0.8))
})

test_that("1. translated coordinates, default deltas", {
  expect_equal(move(4, 3), c(4.1, 3.1))
  expect_equal(move(11, -2.3), c(11.1, -2.2))
})

# translate2d

test_that("2. translate2d with separate deltas", {
  f <- translate2d(0.5, 1)
  expect_equal(f(4, 3), c(4.5, 4))
})

# translate_point

test_that("3. translate_point with vector deltas", {
  f <- translate_point(c(0.5, 1))
  expect_equal(f(c(4, 3)), c(4.5, 4))
})

# scale2d

test_that("4. scale2d with vector scale factors", {
  f <- scale2d(c(0.5, 1.5))
  expect_equal(f(c(4, 3)), c(2, 4.5))
})
