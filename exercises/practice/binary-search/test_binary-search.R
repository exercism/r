# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/binary-search/canonical-data.json
# File last updated on 2026-03-16

source("./binary-search.R")
library(testthat)


test_that("finds a value in an array with one element", {
  haystack <- c(6)
  needle <- 6
  expect_equal(find(haystack, needle), 1)
})

test_that("finds a value in the middle of an array", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 6
  expect_equal(find(haystack, needle), 4)
})

test_that("finds a value at the beginning of an array", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 1
  expect_equal(find(haystack, needle), 1)
})

test_that("finds a value at the end of an array", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 11
  expect_equal(find(haystack, needle), 7)
})

test_that("finds a value in an array of odd length", {
  haystack <- c(1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634)
  needle <- 144
  expect_equal(find(haystack, needle), 10)
})

test_that("finds a value in an array of even length", {
  haystack <- c(1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377)
  needle <- 21
  expect_equal(find(haystack, needle), 6)
})

test_that("identifies that a value is not included in the array", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 7
  expect_equal(find(haystack, needle), -1)
})

test_that("a value smaller than the array's smallest value is not found", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 0
  expect_equal(find(haystack, needle), -1)
})

test_that("a value larger than the array's largest value is not found", {
  haystack <- c(1, 3, 4, 6, 8, 9, 11)
  needle <- 13
  expect_equal(find(haystack, needle), -1)
})

test_that("nothing is found in an empty array", {
  haystack <- c()
  needle <- 1
  expect_equal(find(haystack, needle), -1)
})

test_that("nothing is found when the left and right bounds cross", {
  haystack <- c(1, 2)
  needle <- 0
  expect_equal(find(haystack, needle), -1)
})
