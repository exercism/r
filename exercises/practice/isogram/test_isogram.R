# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/isogram/canonical-data.json
# File last updated on 2026-03-13

source("./isogram.R")
library(testthat)

test_that("empty string", {
  expect_true(is_isogram(""))
})

test_that("isogram with only lower case characters", {
  expect_true(is_isogram("isogram"))
})

test_that("word with one duplicated character", {
  expect_false(is_isogram("eleven"))
})

test_that("word with one duplicated character from the end of the alphabet", {
  expect_false(is_isogram("zzyzx"))
})

test_that("longest reported english isogram", {
  expect_true(is_isogram("subdermatoglyphic"))
})

test_that("word with duplicated character in mixed case", {
  expect_false(is_isogram("Alphabet"))
})

test_that("word with duplicated character in mixed case, lowercase first", {
  expect_false(is_isogram("alphAbet"))
})

test_that("hypothetical isogrammic word with hyphen", {
  expect_true(is_isogram("thumbscrew-japingly"))
})

test_that("hypothetical word with duplicated character following hyphen", {
  expect_false(is_isogram("thumbscrew-jappingly"))
})

test_that("isogram with duplicated hyphen", {
  expect_true(is_isogram("six-year-old"))
})

test_that("made-up name that is an isogram", {
  expect_true(is_isogram("Emily Jung Schwartzkopf"))
})

test_that("duplicated character in the middle", {
  expect_false(is_isogram("accentor"))
})

test_that("same first and last characters", {
  expect_false(is_isogram("angola"))
})

test_that("word with duplicated character and with two hyphens", {
  expect_false(is_isogram("up-to-date"))
})
