source("./pangram.R")
library(testthat)

test_that("empty sentence", {
  expect_false(is_pangram(""))
})

test_that("perfect lower case", {
  expect_true(is_pangram("abcdefghijklmnopqrstuvwxyz"))
})

test_that("only lower case", {
  expect_true(is_pangram("the quick brown fox jumps over the lazy dog"))
})

test_that("missing the letter 'x'", {
  expect_false(
    is_pangram("a quick movement of the enemy will jeopardize five gunboats")
  )
})

test_that("missing the letter 'h'", {
  expect_false(
    is_pangram("five boxing wizards jump quickly at it")
  )
})

test_that("with underscores", {
  expect_true(is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
})

test_that("with numbers", {
  expect_true(is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
})

test_that("missing letters replaced by numbers", {
  expect_false(is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
})

test_that("mixed case and punctuation", {
  expect_true(is_pangram("\"Five quacking Zephyrs jolt my wax bed.\""))
})

test_that("a-m and A-M are 26 different characters but not a pangram", {
  expect_false(is_pangram("abcdefghijklm ABCDEFGHIJKLM"))
})
