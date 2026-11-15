# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/matching-brackets/canonical-data.json
# File last updated on 2026-11-15

source("./matching-brackets.R")
library(testthat)

test_that("paired square brackets", {
  input <- "[]"
  expect_true(is_paired(input))
})

test_that("empty string", {
  input <- ""
  expect_true(is_paired(input))
})

test_that("unpaired brackets", {
  input <- "[["
  expect_false(is_paired(input))
})

test_that("wrong ordered brackets", {
  input <- "}{"
  expect_false(is_paired(input))
})

test_that("wrong closing bracket", {
  input <- "{]"
  expect_false(is_paired(input))
})

test_that("paired with whitespace", {
  input <- "{ }"
  expect_true(is_paired(input))
})

test_that("partially paired brackets", {
  input <- "{[])"
  expect_false(is_paired(input))
})

test_that("simple nested brackets", {
  input <- "{[]}"
  expect_true(is_paired(input))
})

test_that("several paired brackets", {
  input <- "{}[]"
  expect_true(is_paired(input))
})

test_that("paired and nested brackets", {
  input <- "([{}({}[])])"
  expect_true(is_paired(input))
})

test_that("unopened closing brackets", {
  input <- "{[)][]}"
  expect_false(is_paired(input))
})

test_that("unpaired and nested brackets", {
  input <- "([{])"
  expect_false(is_paired(input))
})

test_that("paired and wrong nested brackets", {
  input <- "[({]})"
  expect_false(is_paired(input))
})

test_that("paired and wrong nested brackets but innermost are correct", {
  input <- "[({}])"
  expect_false(is_paired(input))
})

test_that("paired and incomplete brackets", {
  input <- "{}["
  expect_false(is_paired(input))
})

test_that("too many closing brackets", {
  input <- "[]]"
  expect_false(is_paired(input))
})

test_that("early unexpected brackets", {
  input <- ")()"
  expect_false(is_paired(input))
})

test_that("early mismatched brackets", {
  input <- "{)()"
  expect_false(is_paired(input))
})

test_that("math expression", {
  input <- "(((185 + 223.85) * 15) - 543)/2"
  expect_true(is_paired(input))
})

test_that("complex latex expression", {
  input <- "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
  expect_true(is_paired(input))
})
