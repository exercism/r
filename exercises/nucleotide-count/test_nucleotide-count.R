source("./nucleotide-count.R")
library(testthat)

# When comparing lists, all.equal expects the objects to be in the same order
# This expectation instead checks that a) the set of names are the same and
# b) each named object is equal
expect_equal_pairs <- function(object, expected) {
  expect_equal(sort(names(object)),
               sort(names(expected)),
               info = "names in lists differ")
  for (name in names(expected)) {
    expect_equal(object[name], expected[name], info = "list element missing")
  }
}

test_that("empty strand", {
  expect_equal_pairs(nucleotide_count(""),
                     list(
                       A = 0,
                       C = 0,
                       G = 0,
                       T = 0
                     ))
})

test_that("strand with repeated nucleotide", {
  expect_equal_pairs(nucleotide_count("GGGGGGG"),
                     list(
                       A = 0,
                       C = 0,
                       G = 7,
                       T = 0
                     ))
})

test_that("strand with multiple nucleotides", {
  expect_equal_pairs(nucleotide_count(
    "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"),
    list(
      A = 20,
      C = 12,
      G = 17,
      T = 21
    ))
})

test_that("strand with invalid nucleotides", {
  expect_error(nucleotide_count("AGXXACT"))
})

message("All tests passed for exercise: nucleotide-count")
