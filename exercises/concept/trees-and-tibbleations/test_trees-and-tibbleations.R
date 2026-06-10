source("./trees-and-tibbleations.R")
library(testthat)

test_that("1. Rename a column", {
  expect_setequal(names(tree_data), c('Diameter', 'Height', 'Volume'))
  expect_equal(tree_data$Diameter[7:11], c(11, 11, 11.1, 11.2, 11.3))
})

test_that("2. Add girth and weight columns", {
  test_data <- girth_n_weight(tree_data, 1)

  expect_true('Girth' %in% names(test_data))
  expect_equal(test_data$Girth[21:24], c(44, 44.6, 45.6, 50.3))
  expect_true('Weight' %in% names(test_data))
  expect_equal(test_data$Weight[29:31], c(1802.5, 1785.0, 2695.0))
})

test_that("3. Orchard copy of dataset", {
  test_data <- tree_data |> girth_n_weight(1) |> orchard_copy(c('Height', 'Weight'))

  expect_setequal(names(test_data), c('Height', 'Weight', 'Diameter', 'Volume', 'Girth'))
  expect_equal(names(test_data)[1:2], c('Height', 'Weight'))
  expect_equal(test_data$Height[15:18], c(76, 76, 77, 78))
  expect_equal(test_data$Girth[21:24], c(44.6, 56.2, 56.5, 56.5))
  expect_equal(test_data$Weight[5:9], c(745.5, 360.5, 899.5, 574.0, 1340.5))
})

test_that("3. Customer copy of dataset", {
  test_data <- tree_data |> girth_n_weight(1) |> customer_copy(c('Weight', 'Height', 'Girth'), 70, 75, 1000)

  expect_equal(names(test_data), c('Weight', 'Height', 'Girth'))
  expect_equal(test_data$Weight[2:5], c(574.0, 637.0, 696.5, 668.5))
  expect_equal(test_data$Height[4:7], c(75, 75, 74, 71))
  expect_equal(test_data$Girth[1:4], c(26.1, 33.0, 34.6, 35.2))
})
