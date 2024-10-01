source("./knapsack.R")
library(testthat)

test_that("no items", {
  expect_equal(maximum_value(100, list()), 0)
})

test_that("one item, too heavy", {
  items <- list(
    list(weight = 100, value = 1)
  )
  expect_equal(maximum_value(10, items), 0)
})

test_that("five items (cannot be greedy by weight)", {
  items <- list(
    list(weight = 2, value = 5),
    list(weight = 2, value = 5),
    list(weight = 2, value = 5),
    list(weight = 2, value = 5),
    list(weight = 10, value = 21)
  )
  expect_equal(maximum_value(10, items), 21)
})

test_that("five items (cannot be greedy by value)", {
  items <- list(
    list(weight = 2, value = 20),
    list(weight = 2, value = 20),
    list(weight = 2, value = 20),
    list(weight = 2, value = 20),
    list(weight = 10, value = 50)
  )
  expect_equal(maximum_value(10, items), 80)
})

test_that("example knapsack", {
  items <- list(
    list(weight = 5, value = 10),
    list(weight = 4, value = 40),
    list(weight = 6, value = 30),
    list(weight = 4, value = 50)
  )
  expect_equal(maximum_value(10, items), 90)
})

test_that("8 items", {
  items <- list(
    list(weight = 25, value = 350),
    list(weight = 35, value = 400),
    list(weight = 45, value = 450),
    list(weight = 5, value = 20),
    list(weight = 25, value = 70),
    list(weight = 3, value = 8),
    list(weight = 2, value = 5),
    list(weight = 2, value = 5)
  )
  expect_equal(maximum_value(104, items), 900)
})

test_that("15 items", {
  items <- list(
    list(weight = 70, value = 135),
    list(weight = 73, value = 139),
    list(weight = 77, value = 149),
    list(weight = 80, value = 150),
    list(weight = 82, value = 156),
    list(weight = 87, value = 163),
    list(weight = 90, value = 173),
    list(weight = 94, value = 184),
    list(weight = 98, value = 192),
    list(weight = 106, value = 201),
    list(weight = 110, value = 210),
    list(weight = 113, value = 214),
    list(weight = 115, value = 221),
    list(weight = 118, value = 229),
    list(weight = 120, value = 240)
  )
  expect_equal(maximum_value(750, items), 1458)
})
