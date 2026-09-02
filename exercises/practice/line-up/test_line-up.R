# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/line-up/canonical-data.json
# File last updated on 2026-09-02

source("./line-up.R")
library(testthat)

test_that("format smallest non-exceptional ordinal numeral 4", {
  expect_equal(
    line_up("Gianna", 4),
    "Gianna, you are the 4th customer we serve today. Thank you!"
  )
})
test_that("format greatest single digit non-exceptional ordinal numeral 9", {
  expect_equal(
    line_up("Maarten", 9),
    "Maarten, you are the 9th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 5", {
  expect_equal(
    line_up("Petronila", 5),
    "Petronila, you are the 5th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 6", {
  expect_equal(
    line_up("Attakullakulla", 6),
    "Attakullakulla, you are the 6th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 7", {
  expect_equal(
    line_up("Kate", 7),
    "Kate, you are the 7th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 8", {
  expect_equal(
    line_up("Maximiliano", 8),
    "Maximiliano, you are the 8th customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 1", {
  expect_equal(
    line_up("Mary", 1),
    "Mary, you are the 1st customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 2", {
  expect_equal(
    line_up("Haruto", 2),
    "Haruto, you are the 2nd customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 3", {
  expect_equal(
    line_up("Henriette", 3),
    "Henriette, you are the 3rd customer we serve today. Thank you!"
  )
})
test_that("format smallest two digit non-exceptional ordinal numeral 10", {
  expect_equal(
    line_up("Alvarez", 10),
    "Alvarez, you are the 10th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 11", {
  expect_equal(
    line_up("Jacqueline", 11),
    "Jacqueline, you are the 11th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 12", {
  expect_equal(
    line_up("Juan", 12),
    "Juan, you are the 12th customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 13", {
  expect_equal(
    line_up("Patricia", 13),
    "Patricia, you are the 13th customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 21", {
  expect_equal(
    line_up("Washi", 21),
    "Washi, you are the 21st customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 22 ending in nd even though it is a multiple of 11", {
  expect_equal(
    line_up("Ingrid", 22),
    "Ingrid, you are the 22nd customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 33 ending in rd even though it is a multiple of 11", {
  expect_equal(
    line_up("Mario", 33),
    "Mario, you are the 33rd customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 52 ending in nd even though it is a multiple of 13", {
  expect_equal(
    line_up("Quentin", 52),
    "Quentin, you are the 52nd customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 62", {
  expect_equal(
    line_up("Nayra", 62),
    "Nayra, you are the 62nd customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 72 ending in nd even though it is a multiple of 12", {
  expect_equal(
    line_up("Ugo", 72),
    "Ugo, you are the 72nd customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 91 ending in st even though it is a multiple of 13", {
  expect_equal(
    line_up("Boris", 91),
    "Boris, you are the 91st customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 100", {
  expect_equal(
    line_up("John", 100),
    "John, you are the 100th customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 101", {
  expect_equal(
    line_up("Zeinab", 101),
    "Zeinab, you are the 101st customer we serve today. Thank you!"
  )
})
test_that("format non-exceptional ordinal numeral 112", {
  expect_equal(
    line_up("Knud", 112),
    "Knud, you are the 112th customer we serve today. Thank you!"
  )
})
test_that("format exceptional ordinal numeral 123", {
  expect_equal(
    line_up("Yma", 123),
    "Yma, you are the 123rd customer we serve today. Thank you!"
  )
})
test_that("format large number 972 ending in nd even though it is a multiple of 12", {
  expect_equal(
    line_up("Elias", 972),
    "Elias, you are the 972nd customer we serve today. Thank you!"
  )
})
