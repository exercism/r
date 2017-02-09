source('./scrabble-score.R')
suppressPackageStartupMessages({ require(testthat) })

test_that("lowercase letter", {
  input <- "a"
  expect_equal(scrabbleScore(input), 1)
})

test_that("uppercase letter", {
  input <- "A"
  expect_equal(scrabbleScore(input), 1)
})

test_that("valuable letter", {
  input <- "f"
  expect_equal(scrabbleScore(input), 4)
})

test_that("short word", {
  input <- "at"
  expect_equal(scrabbleScore(input), 2)
})

test_that("short, valuable word", {
  input <- "zoo"
  expect_equal(scrabbleScore(input), 12)
})

test_that("medium word", {
  input <- "street"
  expect_equal(scrabbleScore(input), 6)
})

test_that("medium, valuable word", {
  input <- "quirky"
  expect_equal(scrabbleScore(input), 22)
})

test_that("long, mixed-case word", {
  input <- "OxyphenButazone"
  expect_equal(scrabbleScore(input), 41)
})

test_that("english-like word", {
  input <- "pinata"
  expect_equal(scrabbleScore(input), 8)
})

test_that("empty input", {
  input <- ""
  expect_equal(scrabbleScore(input), 0)
})

test_that("entire alphabet available", {
  input <- "abcdefghijklmnopqrstuvwxyz"
  expect_equal(scrabbleScore(input), 87)
})

print("All tests passed!")
