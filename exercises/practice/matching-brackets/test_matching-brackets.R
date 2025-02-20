source("./matching-brackets.R")
library(testthat)

test_that("Paired square brackets", {
  expect_true(is_paired("[]"))
})

test_that("Empty string", {
  expect_true(is_paired(""))
})

test_that("Unpaired brackets", {
  expect_false(is_paired("[["))
})

test_that("Wrong ordered brackets", {
  expect_false(is_paired("}{"))
})

test_that("Wrong closing bracket", {
  expect_false(is_paired("{]"))
})

test_that("Paired with whitespace", {
  expect_true(is_paired("{ }"))
})

test_that("Partially paired brackets", {
  expect_false(is_paired("{[])"))
})

test_that("Simple nested brackets", {
  expect_true(is_paired("{[]}"))
})

test_that("Several paired brackets", {
  expect_true(is_paired("{}[]"))
})

test_that("Paired and nested brackets", {
  expect_true(is_paired("([{}({}[])])"))
})

test_that("Unopened closing brackets", {
  expect_false(is_paired("{[)][]}"))
})

test_that("Unpaired and nested brackets", {
  expect_false(is_paired("([{])"))
})

test_that("Paired and wrong nested brackets", {
  expect_false(is_paired("[({]})"))
})

test_that("Paired and wrong nested brackets but innermost are correct", {
  expect_false(is_paired("[({}])"))
})

test_that("Paired and incomplete brackets", {
  expect_false(is_paired("{}["))
})

test_that("Too many closing brackets", {
  expect_false(is_paired("[]]"))
})

test_that("Early unexpected brackets", {
  expect_false(is_paired(")()"))
})

test_that("Early mismatched brackets", {
  expect_false(is_paired("{)()"))
})

test_that("Math expression", {
  input <- "(((185 + 223.85) * 15) - 543)/2"
  expect_true(is_paired(input))
})

test_that("Complex latex expression", {
  input <- "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)" # nolint
  expect_true(is_paired(input))
})
