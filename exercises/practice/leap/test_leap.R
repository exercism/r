source("./leap.R")
library(testthat)

test_that("year not divisible by 4: common year", {
  year <- 2015
  expect_false(leap(year))
})

test_that("year divisible by 4, not divisible by 100: leap year", {
  year <- 2016
  expect_true(leap(year))
})

test_that("year divisible by 100, not divisible by 400: common year", {
  year <- 2100
  expect_false(leap(year))
})

test_that("year divisible by 400: leap year", {
  year <- 2000
  expect_true(leap(year))
})
