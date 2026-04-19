# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/flower-field/canonical-data.json
# File last updated on 2026-04-19

source("./flower-field.R")
library(testthat)

test_that("no rows", {
  garden <- c()
  expected <- c()
  expect_equal(annotate(garden), expected)
})

test_that("no columns", {
  garden <- c('')
  expected <- c('')
  expect_equal(annotate(garden), expected)
})

test_that("no flowers", {
  garden <- c('   ', '   ', '   ')
  expected <- c('   ', '   ', '   ')
  expect_equal(annotate(garden), expected)
})

test_that("garden full of flowers", {
  garden <- c('***', '***', '***')
  expected <- c('***', '***', '***')
  expect_equal(annotate(garden), expected)
})

test_that("flower surrounded by spaces", {
  garden <- c('   ', ' * ', '   ')
  expected <- c('111', '1*1', '111')
  expect_equal(annotate(garden), expected)
})

test_that("space surrounded by flowers", {
  garden <- c('***', '* *', '***')
  expected <- c('***', '*8*', '***')
  expect_equal(annotate(garden), expected)
})

test_that("horizontal line", {
  garden <- c(' * * ')
  expected <- c('1*2*1')
  expect_equal(annotate(garden), expected)
})

test_that("horizontal line, flowers at edges", {
  garden <- c('*   *')
  expected <- c('*1 1*')
  expect_equal(annotate(garden), expected)
})

test_that("vertical line", {
  garden <- c(' ', '*', ' ', '*', ' ')
  expected <- c('1', '*', '2', '*', '1')
  expect_equal(annotate(garden), expected)
})

test_that("vertical line, flowers at edges", {
  garden <- c('*', ' ', ' ', ' ', '*')
  expected <- c('*', '1', ' ', '1', '*')
  expect_equal(annotate(garden), expected)
})

test_that("cross", {
  garden <- c('  *  ', '  *  ', '*****', '  *  ', '  *  ')
  expected <- c(' 2*2 ', '25*52', '*****', '25*52', ' 2*2 ')
  expect_equal(annotate(garden), expected)
})

test_that("large garden", {
  garden <- c(' *  * ', '  *   ', '    * ', '   * *', ' *  * ', '      ')
  expected <- c('1*22*1', '12*322', ' 123*2', '112*4*', '1*22*2', '111111')
  expect_equal(annotate(garden), expected)
})

test_that("multiple adjacent flowers", {
  garden <- c(' ** ')
  expected <- c('1**1')
  expect_equal(annotate(garden), expected)
})
