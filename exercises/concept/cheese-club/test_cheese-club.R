source("./cheese-club.R")
library(testthat)

# all_15

test_that("1. classify customers, false", {
  expect_false(all_15(c(2, 3, 4, 4, 1)))
  expect_false(all_15(c(5, 1, 5, 1, 5, 4, 2, 3, 1, 5, 4, 4, 2, 3)))
})

test_that("1. classify customers, true", {
  expect_true(all_15(c(1, 5, 5, 1, 5)))
  expect_true(all_15(c(5, 1, 5, 1, 5, 5, 1, 1, 1, 5, 5, 5, 1, 5)))
})

# name_customers

test_that("2. name customers", {
  names <- c("c1", "c2", "c3", "c4")
  ratings = list(c(2, 3, 5, 1, 1), c(1, 1, 5, 5, 1), 
                 c(4, 5, 5, 3, 2), c(5, 5, 1, 1, 5))
  expected <- list(
    list(name = "c1", rating = c(2, 3, 5, 1, 1)),
    list(name = "c2", rating = c(1, 1, 5, 5, 1)),
    list(name = "c3", rating = c(4, 5, 5, 3, 2)),
    list(name = "c4", rating = c(5, 5, 1, 1, 5))
  )
  
  expect_equal(name_customers(names, ratings), expected)
})

# emphatics

test_that("3. separate out emphatic customers, some true", {
  names <- c("c1", "c2", "c3", "c4")
  ratings = list(c(2, 3, 5, 1, 1), c(1, 1, 5, 5, 1), 
                 c(4, 5, 5, 3, 2), c(5, 5, 1, 1, 5))
  expected <- list(
    list(name = "c2", rating = c(1, 1, 5, 5, 1)),
    list(name = "c4", rating = c(5, 5, 1, 1, 5))
  )
  
  expect_equal(emphatics(names, ratings), expected)
})

test_that("3. separate out emphatic customers, all true", {
  names <- c("c1", "c2")
  ratings = list(c(1, 5, 5), c(5, 1, 1))
  expected <- list(
    list(name = "c1", rating = c(1, 5, 5)),
    list(name = "c2", rating = c(5, 1, 1))
  )
  
  expect_equal(emphatics(names, ratings), expected)
})

test_that("3. separate out emphatic customers, none true", {
  names <- c("c1", "c2")
  ratings = list(c(1, 2, 5), c(3, 1, 4))
  expected <- list()

  expect_equal(emphatics(names, ratings), expected)
})

# to_binary

test_that("4. change ratings to binary", {
  expect_equal(to_binary(c(1, 1, 5, 5, 1)), c(0, 0, 1, 1, 0))
  expect_equal(to_binary(c(5, 1, 5, 1, 5, 5, 1, 1, 1, 5, 5, 5, 1, 5)), 
                         c(1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1))
})

# satisfactions

test_that("5. cumulative average ratings", {
  expect_equal(satisfactions(c(3, 3, 3, 3, 3)), c(3, 3, 3, 3, 3))
  expect_equal(satisfactions(c(1, 2, 3, 4, 5)), c(1.0, 1.5, 2.0, 2.5, 3.0))
  expect_equal(satisfactions(c(2, 2, 5, 4, 2)), c(2.00, 2.00, 3.00, 3.25, 3.00))
})
