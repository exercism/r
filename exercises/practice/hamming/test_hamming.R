# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/hamming/canonical-data.json
# File last updated on 2026-03-11

source("./hamming.R")
library(testthat)

test_that("empty strands", {
  strand1 <- ""
  strand2 <- ""
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("single letter identical strands", {
  strand1 <- "A"
  strand2 <- "A"
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("single letter different strands", {
  strand1 <- "G"
  strand2 <- "T"
  expect_equal(hamming(strand1, strand2), 1)
})

test_that("long identical strands", {
  strand1 <- "GGACTGAAATCTG"
  strand2 <- "GGACTGAAATCTG"
  expect_equal(hamming(strand1, strand2), 0)
})

test_that("long different strands", {
  strand1 <- "GGACGGATTCTG"
  strand2 <- "AGGACGGATTCT"
  expect_equal(hamming(strand1, strand2), 9)
})

test_that("disallow first strand longer", {
  strand1 <- "AATG"
  strand2 <- "AAA"
  expect_error(hamming(strand1, strand2))
})

test_that("disallow second strand longer", {
  strand1 <- "ATA"
  strand2 <- "AGTG"
  expect_error(hamming(strand1, strand2))
})

test_that("disallow left empty strand", {
  strand1 <- ""
  strand2 <- "G"
  expect_error(hamming(strand1, strand2))
})

test_that("disallow right empty strand", {
  strand1 <- "G"
  strand2 <- ""
  expect_error(hamming(strand1, strand2))
})
