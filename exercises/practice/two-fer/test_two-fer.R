# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/two-fer/canonical-data.json
# File last updated on 2026-11-15

source("./two-fer.R")
library(testthat)

test_that("no name given", {
  expect_equal(two_fer(), "One for you, one for me.")
})

test_that("a name given", {
  expect_equal(two_fer("Alice"), "One for Alice, one for me.")
})

test_that("another name given", {
  expect_equal(two_fer("Bob"), "One for Bob, one for me.")
})
