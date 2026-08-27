# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/isbn-verifier/canonical-data.json
# File last updated on 2026-03-13

source("./isbn-verifier.R")
library(testthat)

test_that("valid isbn", {
  expect_true(is_valid("3-598-21508-8"))
})

test_that("invalid isbn check digit", {
  expect_false(is_valid("3-598-21508-9"))
})

test_that("valid isbn with a check digit of 10", {
  expect_true(is_valid("3-598-21507-X"))
})

test_that("check digit is a character other than X", {
  expect_false(is_valid("3-598-21507-A"))
})

test_that("invalid check digit in isbn is not treated as zero", {
  expect_false(is_valid("4-598-21507-B"))
})

test_that("invalid character in isbn is not treated as zero", {
  expect_false(is_valid("3-598-P1581-X"))
})

test_that("X is only valid as a check digit", {
  expect_false(is_valid("3-598-2X507-9"))
})

test_that("only one check digit is allowed", {
  expect_false(is_valid("3-598-21508-96"))
})

test_that("X is not substituted by the value 10", {
  expect_false(is_valid("3-598-2X507-5"))
})

test_that("valid isbn without separating dashes", {
  expect_true(is_valid("3598215088"))
})

test_that("isbn without separating dashes and X as check digit", {
  expect_true(is_valid("359821507X"))
})

test_that("isbn without check digit and dashes", {
  expect_false(is_valid("359821507"))
})

test_that("too long isbn and no dashes", {
  expect_false(is_valid("3598215078X"))
})

test_that("too short isbn", {
  expect_false(is_valid("00"))
})

test_that("isbn without check digit", {
  expect_false(is_valid("3-598-21507"))
})

test_that("check digit of X should not be used for 0", {
  expect_false(is_valid("3-598-21515-X"))
})

test_that("empty isbn", {
  expect_false(is_valid(""))
})

test_that("input is 9 characters", {
  expect_false(is_valid("134456729"))
})

test_that("invalid characters are not ignored after checking length", {
  expect_false(is_valid("3132P34035"))
})

test_that("invalid characters are not ignored before checking length", {
  expect_false(is_valid("3598P215088"))
})

test_that("input is too long but contains a valid isbn", {
  expect_false(is_valid("98245726788"))
})
