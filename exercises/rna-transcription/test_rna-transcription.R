source('./rna-transcription.R')
library(testthat)

test_that("rna complement of cytosine is guanine", {
  dna <- "C"
  expect_equal(to_rna(dna), "G")
})

test_that("rna complement of guanine is cytosine", {
  dna <- "G"
  expect_equal(to_rna(dna), "C")
})

test_that("rna complement of thymine is adenine", {
  dna <- "T"
  expect_equal(to_rna(dna), "A")
})

test_that("rna complement of adenine is uracil", {
  dna <- "A"
  expect_equal(to_rna(dna), "U")
})

test_that("rna complement", {
  dna <- "ACGTGGTCTTAA"
  expect_equal(to_rna(dna), "UGCACCAGAAUU")
})

test_that("dna correctly handles invalid input", {
  dna <- "U"
  expect_error(to_rna(dna))
})

test_that("dna correctly handles completely invalid input", {
  dna <- "XXX"
  expect_error(to_rna(dna))
})

test_that("dna correctly handles partially invalid input", {
  dna <- "ACGTXXXCTTAA"
  expect_error(to_rna(dna))
})

print("All tests passed!")
