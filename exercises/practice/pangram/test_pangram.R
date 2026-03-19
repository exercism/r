# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/pangram/canonical-data.json
# File last updated on 2026-03-19

source("./pangram.R")
library(testthat)

test_that("empty sentence", {
  sentence <- ''
  expect_false(is_pangram(sentence))
})

test_that("perfect lower case", {
  sentence <- 'abcdefghijklmnopqrstuvwxyz'
  expect_true(is_pangram(sentence))
})

test_that("only lower case", {
  sentence <- 'the quick brown fox jumps over the lazy dog'
  expect_true(is_pangram(sentence))
})

test_that("missing the letter 'x'", {
  sentence <- 'a quick movement of the enemy will jeopardize five gunboats'
  expect_false(is_pangram(sentence))
})

test_that("missing the letter 'h'", {
  sentence <- 'five boxing wizards jump quickly at it'
  expect_false(is_pangram(sentence))
})

test_that("with underscores", {
  sentence <- 'the_quick_brown_fox_jumps_over_the_lazy_dog'
  expect_true(is_pangram(sentence))
})

test_that("with numbers", {
  sentence <- 'the 1 quick brown fox jumps over the 2 lazy dogs'
  expect_true(is_pangram(sentence))
})

test_that("missing letters replaced by numbers", {
  sentence <- '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
  expect_false(is_pangram(sentence))
})

test_that("mixed case and punctuation", {
  sentence <- '"Five quacking Zephyrs jolt my wax bed."'
  expect_true(is_pangram(sentence))
})

test_that("a-m and A-M are 26 different characters but not a pangram", {
  sentence <- 'abcdefghijklm ABCDEFGHIJKLM'
  expect_false(is_pangram(sentence))
})
