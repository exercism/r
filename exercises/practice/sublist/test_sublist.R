source("./sublist.R")
library(testthat)

test_that("Empty vectors", {
  vector_one <- c()
  vector_two <- c()
  expect_equal(compare(vector_one, vector_two), "equal")
})

test_that("Empty vector within non empty vector", {
  vector_one <- c()
  vector_two <- c(1, 2, 3)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("Non empty vector contains empty vector", {
  vector_one <- c(1, 2, 3)
  vector_two <- c()
  expect_equal(compare(vector_one, vector_two), "supervector")
})

test_that("vector equals itself", {
  vector_one <- c(1, 2, 3)
  vector_two <- c(1, 2, 3)
  expect_equal(compare(vector_one, vector_two), "equal")
})

test_that("Different vectors", {
  vector_one <- c(1, 2, 3)
  vector_two <- c(2, 3, 4)
  expect_equal(compare(vector_one, vector_two), "unequal")
})

test_that("False start", {
  vector_one <- c(1, 2, 5)
  vector_two <- c(0, 1, 2, 3, 1, 2, 5, 6)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("Consecutive", {
  vector_one <- c(1, 1, 2)
  vector_two <- c(0, 1, 1, 1, 2, 1, 2)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("Subvector at start", {
  vector_one <- c(0, 1, 2)
  vector_two <- c(0, 1, 2, 3, 4, 5)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("Subvector in middle", {
  vector_one <- c(2, 3, 4)
  vector_two <- c(0, 1, 2, 3, 4, 5)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("Subvector at end", {
  vector_one <- c(3, 4, 5)
  vector_two <- c(0, 1, 2, 3, 4, 5)
  expect_equal(compare(vector_one, vector_two), "subvector")
})

test_that("At start of supervector", {
  vector_one <- c(0, 1, 2, 3, 4, 5)
  vector_two <- c(0, 1, 2)
  expect_equal(compare(vector_one, vector_two), "supervector")
})

test_that("In middle of supervector", {
  vector_one <- c(0, 1, 2, 3, 4, 5)
  vector_two <- c(2, 3)
  expect_equal(compare(vector_one, vector_two), "supervector")
})

test_that("At end of supervector", {
  vector_one <- c(0, 1, 2, 3, 4, 5)
  vector_two <- c(3, 4, 5)
  expect_equal(compare(vector_one, vector_two), "supervector")
})

test_that("First vector missing element from second vector", {
  vector_one <- c(1, 3)
  vector_two <- c(1, 2, 3)
  expect_equal(compare(vector_one, vector_two), "unequal")
})

test_that("Second vector missing element from first vector", {
  vector_one <- c(1, 2, 3)
  vector_two <- c(1, 3)
  expect_equal(compare(vector_one, vector_two), "unequal")
})

test_that("First vector missing additional digits from second vector", {
  vector_one <- c(1, 2)
  vector_two <- c(1, 22)
  expect_equal(compare(vector_one, vector_two), "unequal")
})

test_that("Order matters to a vector", {
  vector_one <- c(1, 2, 3)
  vector_two <- c(3, 2, 1)
  expect_equal(compare(vector_one, vector_two), "unequal")
})

test_that("Same digits but different numbers", {
  vector_one <- c(1, 0, 1)
  vector_two <- c(10, 1)
  expect_equal(compare(vector_one, vector_two), "unequal")
})
