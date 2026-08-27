# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/resistor-color/canonical-data.json
# File last updated on 2026-03-20

source("./resistor-color.R")
library(testthat)

test_that("Black", {
  input <- "black"
  expected <- 0
  expect_equal(color_code(input), expected)
})

test_that("White", {
  input <- "white"
  expected <- 9
  expect_equal(color_code(input), expected)
})

test_that("Orange", {
  input <- "orange"
  expected <- 3
  expect_equal(color_code(input), expected)
})

test_that("Colors", {
  expect_equal(
    colors,
    c(
      'black',
      'brown',
      'red',
      'orange',
      'yellow',
      'green',
      'blue',
      'violet',
      'grey',
      'white'
    )
  )
})
