# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/rna-transcription/canonical-data.json
# File last updated on 2026-11-15

source("./rna-transcription.R")
library(testthat)

test_that("Empty RNA sequence", {
  dna <- ""
  expect_equal(to_rna(dna), "")
})

test_that("RNA complement of cytosine is guanine", {
  dna <- "C"
  expect_equal(to_rna(dna), "G")
})

test_that("RNA complement of guanine is cytosine", {
  dna <- "G"
  expect_equal(to_rna(dna), "C")
})

test_that("RNA complement of thymine is adenine", {
  dna <- "T"
  expect_equal(to_rna(dna), "A")
})

test_that("RNA complement of adenine is uracil", {
  dna <- "A"
  expect_equal(to_rna(dna), "U")
})

test_that("RNA complement", {
  dna <- "ACGTGGTCTTAA"
  expect_equal(to_rna(dna), "UGCACCAGAAUU")
})

# Additional tests for this track

test_that("DNA correctly handles invalid input", {
  dna <- "U"
  expect_error(to_rna(dna))
})

test_that("DNA correctly handles completely invalid input", {
  dna <- "XXX"
  expect_error(to_rna(dna))
})

test_that("DNA correctly handles partially invalid input", {
  dna <- "ACGTXXXCTTAA"
  expect_error(to_rna(dna))
})
