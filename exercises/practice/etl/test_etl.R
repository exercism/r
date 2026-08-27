# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/etl/canonical-data.json
# File last updated on 2026-03-19

source("./etl.R")
library(testthat)

test_that("single letter", {
  input <- list('1' = c('A'))
  expected <- list(a = 1)
  expect_equal(etl(input), expected)
})

test_that("single score with multiple letters", {
  input <- list('1' = c('A', 'E', 'I', 'O', 'U'))
  expected <- list(a = 1, e = 1, i = 1, o = 1, u = 1)
  expect_equal(etl(input), expected)
})

test_that("multiple scores with multiple letters", {
  input <- list('1' = c('A', 'E'), '2' = c('D', 'G'))
  expected <- list(a = 1, d = 2, e = 1, g = 2)
  expect_equal(etl(input), expected)
})

test_that("multiple scores with differing numbers of letters", {
  input <- list(
    '1' = c('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'),
    '2' = c('D', 'G'),
    '3' = c('B', 'C', 'M', 'P'),
    '4' = c('F', 'H', 'V', 'W', 'Y'),
    '5' = c('K'),
    '8' = c('J', 'X'),
    '10' = c('Q', 'Z')
  )
  expected <- list(
    a = 1,
    b = 3,
    c = 3,
    d = 2,
    e = 1,
    f = 4,
    g = 2,
    h = 4,
    i = 1,
    j = 8,
    k = 5,
    l = 1,
    m = 3,
    n = 1,
    o = 1,
    p = 3,
    q = 10,
    r = 1,
    s = 1,
    t = 1,
    u = 1,
    v = 4,
    w = 4,
    x = 8,
    y = 4,
    z = 10
  )
  expect_equal(etl(input), expected)
})
