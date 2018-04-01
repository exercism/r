source("./word-count.R")
library(testthat)

context("word count")

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

test_that("count one word", {
  expect_equal_pairs(word_count("word"),
                     list("word" = 1))
})

test_that("count one of each word", {
  expect_equal_pairs(word_count("one of each"),
                     list(
                       "one" = 1,
                       "of" = 1,
                       "each" = 1
                     ))
})

test_that("multiple occurrences of a word", {
  expect_equal_pairs(
    word_count("one fish two fish red fish blue fish"),
    list(
      "one" = 1,
      "fish" = 4,
      "two" = 1,
      "red" = 1,
      "blue" = 1
    )
  )
})

test_that("ignore punctuation", {
  expect_equal_pairs(
    word_count("car : carpet as java : javascript!!&@$%^&"),
    list(
      "car" = 1,
      "carpet" = 1,
      "as" = 1,
      "java" = 1,
      "javascript" = 1
    )
  )
})

test_that("include numbers", {
  expect_equal_pairs(word_count("testing, 1, 2 testing"),
                     list(
                       "testing" = 2,
                       "1" = 1,
                       "2" = 1
                     ))
})

test_that("normalize case", {
  expect_equal_pairs(word_count("go Go GO Stop stop"),
                     list("go" = 3, "stop" = 2))
})

test_that("multiple whitespaces", {
  expect_equal_pairs(word_count(" multiple   whitespaces "),
                     list("multiple" = 1, "whitespaces" = 1))
})

message("All tests passed for exercise: word-count")
