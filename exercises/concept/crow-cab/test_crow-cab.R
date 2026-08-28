source("./crow-cab.R")
library(testthat)

# 1. Simple complex

test_that("1. Creates complex number correctly", {
  expect_type(simplex(1, 1), "complex")
  expect_equal(simplex(3, 4), 3 + 4i)
  expect_equal(simplex(-1, 2), -1 + 2i)
  expect_equal(simplex(-5, -7), -5 - 7i)
  expect_equal(simplex(8, -2), 8 - 2i)
})

# 2. Find driver directions

test_that("2. Finds driver directions correctly", {
  expect_equal(driver_directions(0 + 0i, 4 + 3i), 4 + 3i)
  expect_equal(driver_directions(1 + 1i, 4 + 3i), 3 + 2i)
  expect_equal(driver_directions(1 + 1i, -5 - 2i), -6 - 3i)
  expect_equal(driver_directions(2 + 1i, -3 + 2i), -5 + 1i)
  expect_equal(driver_directions(3 + 4i, 3 - 2i), -6i)
})

# 3. Get Manhattan distance

test_that("3. Finds correct Manhattan distance", {
  expect_equal(manhattan(0 + 0i, 0 + 0i), 0)
  expect_equal(manhattan(0 + 0i, 3 + 4i), 7)
  expect_equal(manhattan(-4 + 2i, -2 - 2i), 6)
  expect_equal(manhattan(1 + 5i, -3 - 1i), 10)
})

# 4. Get Euclidean distance

test_that("4. Finds correct Euclidean distance", {
  expect_equal(as_crow_flies(0 + 0i, 0 + 0i), 0)
  expect_equal(as_crow_flies(1 + 1i, -2 - 3i), 5)
  expect_equal(as_crow_flies(-3 + 8i, 5 + 2i), 10)
  expect_equal(as_crow_flies(-2 - 7i, 3 + 5i), 13)
})

# 5. Find crow directions

test_that("5. Finds crow directions", {
  expect_equal(crow_directions(0 + 0i, 4 + 3i), 4 - 3i)
  expect_equal(crow_directions(1 + 1i, 4 + 3i), 3 - 2i)
  expect_equal(crow_directions(1 + 1i, -5 - 2i), -6 + 3i)
  expect_equal(crow_directions(2 + 1i, -3 + 2i), -5 - 1i)
  expect_equal(crow_directions(3 + 4i, 3 - 2i), 6i)
})
