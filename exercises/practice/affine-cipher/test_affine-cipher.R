# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/affine-cipher/canonical-data.json
# File last updated on 2026-08-28

source("./affine-cipher.R")
library(testthat)


# encode

test_that("encode yes", {
  expect_equal(encode("yes", 5, 7), "xbt")
})

test_that("encode no", {
  expect_equal(encode("no", 15, 18), "fu")
})

test_that("encode OMG", {
  expect_equal(encode("OMG", 21, 3), "lvz")
})

test_that("encode O M G", {
  expect_equal(encode("O M G", 25, 47), "hjp")
})

test_that("encode mindblowingly", {
  expect_equal(encode("mindblowingly", 11, 15), "rzcwa gnxzc dgt")
})

test_that("encode numbers", {
  expect_equal(encode("Testing,1 2 3, testing.", 3, 4), "jqgjc rw123 jqgjc rw")
})

test_that("encode deep thought", {
  expect_equal(encode("Truth is fiction.", 5, 17), "iynia fdqfb ifje")
})

test_that("encode all the letters", {
  expect_equal(
    encode("The quick brown fox jumps over the lazy dog.", 17, 33),
    "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
  )
})

test_that("encode with a not coprime to m", {
  expect_error(encode("This is a test.", 6, 17))
})


# decode

test_that("decode exercism", {
  expect_equal(decode("tytgn fjr", 3, 7), "exercism")
})

test_that("decode a sentence", {
  expect_equal(
    decode("qdwju nqcro muwhn odqun oppmd aunwd o", 19, 16),
    "anobstacleisoftenasteppingstone"
  )
})

test_that("decode numbers", {
  expect_equal(decode("odpoz ub123 odpoz ub", 25, 7), "testing123testing")
})

test_that("decode all the letters", {
  expect_equal(
    decode("swxtj npvyk lruol iejdc blaxk swxmh qzglf", 17, 33),
    "thequickbrownfoxjumpsoverthelazydog"
  )
})

test_that("decode with no spaces in input", {
  expect_equal(
    decode("swxtjnpvyklruoliejdcblaxkswxmhqzglf", 17, 33),
    "thequickbrownfoxjumpsoverthelazydog"
  )
})

test_that("decode with too many spaces", {
  expect_equal(decode("vszzm    cly   yd cg    qdp", 15, 16), "jollygreengiant")
})

test_that("decode with a not coprime to m", {
  expect_error(decode("Test", 13, 5))
})
