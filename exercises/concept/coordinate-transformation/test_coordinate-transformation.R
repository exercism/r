source("./coordinate-transformation.R")
library(testthat)

# scale

test_that("1. scale2d with single scale factor", {
  expect_equal(scale(c(0.5, 1.5), 3), c(1.5, 4.5))
})

test_that("1. scale2d with vector scale factors", {
  expect_equal(scale(c(0.5, 1.5), c(1.5, 2)), c(0.75, 3.0))
})

# translate

test_that("2. translated 2D coordinates, with variable args", {
  expect_equal(translate(c(4, 3), 0.5, 1), c(4.5, 4))
  expect_equal(translate(c(11, -2.3), -0.7, 3.1), c(10.3, 0.8))
})

test_that("2. translated 3D coordinates, with variable args", {
  expect_equal(translate(c(4, 3, 5), 0.5, 1, 1.5), c(4.5, 4, 6.5))
  expect_equal(translate(c(11, -2.3, -4.2), -0.7, 3.1, -1.6), c(10.3, 0.8, -5.8))
})

# transform2d

test_that("3. transform2d with default args", {
  f <- transform2d(0.1, 0.1)
  point <- c(4, 3)
  expect_equal(f(point), c(4.1, 3.1))
})

test_that("3. transform2d with optional args", {
  f <- transform2d(dy = 0.5, dx = 1, s = 2)
  point <- c(4, 3)
  expected <- c(10, 7)
  expect_equal(f(point), expected)
})

# transform3d

test_that("4. transform3d with default args", {
  f <- transform3d(0.1, 0.1, 0.1)
  point <- c(4, 3, 1)
  expected <- c(4.1, 3.1, 1.1)
  expect_equal(f(point), expected)
})

test_that("4. transform3d with optional args", {
  f <- transform3d(dx = 0.5, dz = 2, dy = 1, s = 1.5)
  point <- c(4, 3, 1)
  expected <- c(6.75, 6.0, 4.5)
  expect_equal(f(point), expected)
})

