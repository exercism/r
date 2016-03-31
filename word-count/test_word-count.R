source('./word-count.R')
suppressPackageStartupMessages({ require(testthat) })

test_that("count one word", {
  expect_equal(word_count("word"),
    list("word" = 1)
  )
})

test_that("count one of each word", {
  expect_equal(word_count("one of each"),
    list("one" = 1, "of" = 1, "each" = 1)
  )
})

test_that("multiple occurrences of a word", {
  expect_equal(word_count("one fish two fish red fish blue fish"),
    list("one" = 1, "fish" = 4, "two" = 1, "red" = 1, "blue" = 1)
  )
})

test_that("ignore punctuation", {
  expect_equal(word_count("car : carpet as java : javascript!!&@$%^&"),
    list("car" = 1, "carpet" = 1, "as" = 1, "java" = 1, "javascript" = 1)
  )
})

test_that("include numbers", {
  expect_equal(word_count("testing, 1, 2 testing"),
    list("testing" = 2, "1" = 1, "2" = 1)
  )
})

test_that("normalize case", {
  expect_equal(word_count("go Go GO Stop stop"),
    list("go" = 3, "stop" = 2)
  )
})

print("All tests passed!")
