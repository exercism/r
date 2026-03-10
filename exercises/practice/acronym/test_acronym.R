# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/acronym/canonical-data.json
# File last updated on 2026-03-10

source("./acronym.R")
library(testthat)

test_that("basic", {
  input <- "Portable Network Graphics"
  expect_equal(
    acronym(input),
    "PNG"
  )
})

test_that("lowercase words", {
  input <- "Ruby on Rails"
  expect_equal(
    acronym(input),
    "ROR"
  )
})

test_that("punctuation", {
  input <- "First In, First Out"
  expect_equal(
    acronym(input),
    "FIFO"
  )
})

test_that("all caps word", {
  input <- "GNU Image Manipulation Program"
  expect_equal(
    acronym(input),
    "GIMP"
  )
})

test_that("punctuation without whitespace", {
  input <- "Complementary metal-oxide semiconductor"
  expect_equal(
    acronym(input),
    "CMOS"
  )
})

test_that("very long abbreviation", {
  input <- "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
  expect_equal(
    acronym(input),
    "ROTFLSHTMDCOALM"
  )
})

test_that("consecutive delimiters", {
  input <- "Something - I made up from thin air"
  expect_equal(
    acronym(input),
    "SIMUFTA"
  )
})

test_that("apostrophes", {
  input <- "Halley's Comet"
  expect_equal(
    acronym(input),
    "HC"
  )
})

test_that("underscore emphasis", {
  input <- "The Road _Not_ Taken"
  expect_equal(
    acronym(input),
    "TRNT"
  )
})
