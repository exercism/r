# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/eliuds-eggs/canonical-data.json
# File last updated on 2026-11-15

source("./eliuds-eggs.R")
library(testthat)

test_that("0 eggs", {
  expect_equal(egg_count(0), 0)
})

test_that("1 egg", {
  expect_equal(egg_count(16), 1)
})

test_that("4 eggs", {
  expect_equal(egg_count(89), 4)
})

test_that("13 eggs", {
  expect_equal(egg_count(2000000000), 13)
})
