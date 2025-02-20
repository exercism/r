source("./isogram.R")
library(testthat)

test_that("empty string", {
  word <- ""
  expect_true(is_isogram(word))
})

test_that("isogram with only lower case characters", {
  word <- "isogram"
  expect_true(is_isogram(word))
})

test_that("word with one duplicated character", {
  word <- "eleven"
  expect_false(is_isogram(word))
})

test_that("longest reported english isogram", {
  word <- "subdermatoglyphic"
  expect_true(is_isogram(word))
})

test_that("word with duplicated character in mixed case", {
  word <- "Alphabet"
  expect_false(is_isogram(word))
})

test_that("hypothetical isogrammic word with hyphen", {
  word <- "thumbscrew-japingly"
  expect_true(is_isogram(word))
})

test_that("isogram with duplicated non letter character", {
  word <- "Hjelmqvist-Gryb-Zock-Pfund-Wax"
  expect_true(is_isogram(word))
})

test_that("made-up name that is an isogram", {
  word <- "Emily Jung Schwartzkopf"
  expect_true(is_isogram(word))
})
