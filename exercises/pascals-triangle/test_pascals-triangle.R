source('./pascals-triangle.R')
suppressPackageStartupMessages({ require(testthat) })

test_that("zero rows", {
  expect_equal(pascalsTriangle(0), list())
})

test_that("single row", {
  expect_equal(pascalsTriangle(1), list(1))
})

test_that("two rows", {
  expect_equal(pascalsTriangle(2), list(1, c(1, 1)))
})

test_that("three rows", {
  expect_equal(pascalsTriangle(3), list(1, c(1, 1), c(1, 2, 1)))
})

test_that("four rows", {
  expect_equal(pascalsTriangle(4), list(1, c(1, 1), c(1, 2, 1), c(1, 3, 3, 1)))
})

test_that("negative rows", {
  expect_error(pascalsTriangle(-1))
})

test_that("null/no rows", {
  expect_error(pascalsTriangle(NULL))
})

print("All tests passed!")
