# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/line-up/canonical-data.json
# File last updated on 2026-07-26

source("./line-up.R")
library(testthat)

test_that("format smallest non-exceptional ordinal numeral 4", {
  input_base <-
    expect_equal(
      line_up("Gianna", 4),
      "Gianna, you are the 4th customer we serve today. Thank you!"
    )
})
test_that("format greatest single digit non-exceptional ordinal numeral 9", {
  input_base <-
    expect_equal(
      line_up("Maarten", 9),
      "Maarten, you are the 9th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 5", {
  input_base <-
    expect_equal(
      line_up("Petronila", 5),
      "Petronila, you are the 5th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 6", {
  input_base <-
    expect_equal(
      line_up("Attakullakulla", 6),
      "Attakullakulla, you are the 6th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 7", {
  input_base <-
    expect_equal(
      line_up("Kate", 7),
      "Kate, you are the 7th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 8", {
  input_base <-
    expect_equal(
      line_up("Maximiliano", 8),
      "Maximiliano, you are the 8th customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 1", {
  input_base <-
    expect_equal(
      line_up("Mary", 1),
      "Mary, you are the 1st customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 2", {
  input_base <-
    expect_equal(
      line_up("Haruto", 2),
      "Haruto, you are the 2nd customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 3", {
  input_base <-
    expect_equal(
      line_up("Henriette", 3),
      "Henriette, you are the 3rd customer we serve today. Thank you!"
    )
})
test_that("format smallest two digit non-exceptional ordinal numeral 10", {
  input_base <-
    expect_equal(
      line_up("Alvarez", 10),
      "Alvarez, you are the 10th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 11", {
  input_base <-
    expect_equal(
      line_up("Jacqueline", 11),
      "Jacqueline, you are the 11th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 12", {
  input_base <-
    expect_equal(
      line_up("Juan", 12),
      "Juan, you are the 12th customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 13", {
  input_base <-
    expect_equal(
      line_up("Patricia", 13),
      "Patricia, you are the 13th customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 21", {
  input_base <-
    expect_equal(
      line_up("Washi", 21),
      "Washi, you are the 21st customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 62", {
  input_base <-
    expect_equal(
      line_up("Nayra", 62),
      "Nayra, you are the 62nd customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 100", {
  input_base <-
    expect_equal(
      line_up("John", 100),
      "John, you are the 100th customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 101", {
  input_base <-
    expect_equal(
      line_up("Zeinab", 101),
      "Zeinab, you are the 101st customer we serve today. Thank you!"
    )
})
test_that("format non-exceptional ordinal numeral 112", {
  input_base <-
    expect_equal(
      line_up("Knud", 112),
      "Knud, you are the 112th customer we serve today. Thank you!"
    )
})
test_that("format exceptional ordinal numeral 123", {
  input_base <-
    expect_equal(
      line_up("Yma", 123),
      "Yma, you are the 123rd customer we serve today. Thank you!"
    )
})
