# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/leap/canonical-data.json
# File last updated on 2026-03-19

source("./leap.R")
library(testthat)

test_that("year not divisible by 4 in common year", {
  year <- 2015
  expect_false(leap(year))
})

test_that("year divisible by 2, not divisible by 4 in common year", {
  year <- 1970
  expect_false(leap(year))
})

test_that("year divisible by 4, not divisible by 100 in leap year", {
  year <- 1996
  expect_true(leap(year))
})

test_that("year divisible by 4 and 5 is still a leap year", {
  year <- 1960
  expect_true(leap(year))
})

test_that("year divisible by 100, not divisible by 400 in common year", {
  year <- 2100
  expect_false(leap(year))
})

test_that("year divisible by 100 but not by 3 is still not a leap year", {
  year <- 1900
  expect_false(leap(year))
})

test_that("year divisible by 400 is leap year", {
  year <- 2000
  expect_true(leap(year))
})

test_that("year divisible by 400 but not by 125 is still a leap year", {
  year <- 2400
  expect_true(leap(year))
})

test_that("year divisible by 200, not divisible by 400 in common year", {
  year <- 1800
  expect_false(leap(year))
})
