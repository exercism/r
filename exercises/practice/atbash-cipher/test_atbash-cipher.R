# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/atbash-cipher/canonical-data.json
# File last updated on 2026-03-16

source("./atbash-cipher.R")
library(testthat)


# encode

test_that("encode yes", {
  ciphertext <- "yes"
  expected <- "bvh"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode no", {
  ciphertext <- "no"
  expected <- "ml"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode OMG", {
  ciphertext <- "OMG"
  expected <- "lnt"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode spaces", {
  ciphertext <- "O M G"
  expected <- "lnt"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode mindblowingly", {
  ciphertext <- "mindblowingly"
  expected <- "nrmwy oldrm tob"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode numbers", {
  ciphertext <- "Testing,1 2 3, testing."
  expected <- "gvhgr mt123 gvhgr mt"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode deep thought", {
  ciphertext <- "Truth is fiction."
  expected <- "gifgs rhurx grlm"
  expect_equal(encode(ciphertext), expected)
})

test_that("encode all the letters", {
  ciphertext <- "The quick brown fox jumps over the lazy dog."
  expected <- "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expect_equal(encode(ciphertext), expected)
})


# decode

test_that("decode exercism", {
  ciphertext <- "vcvix rhn"
  expected <- "exercism"
  expect_equal(decode(ciphertext), expected)
})

test_that("decode a sentence", {
  ciphertext <- "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  expected <- "anobstacleisoftenasteppingstone"
  expect_equal(decode(ciphertext), expected)
})

test_that("decode numbers", {
  ciphertext <- "gvhgr mt123 gvhgr mt"
  expected <- "testing123testing"
  expect_equal(decode(ciphertext), expected)
})

test_that("decode all the letters", {
  ciphertext <- "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expected <- "thequickbrownfoxjumpsoverthelazydog"
  expect_equal(decode(ciphertext), expected)
})

test_that("decode with too many spaces", {
  ciphertext <- "vc vix    r hn"
  expected <- "exercism"
  expect_equal(decode(ciphertext), expected)
})

test_that("decode with no spaces", {
  ciphertext <- "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  expected <- "anobstacleisoftenasteppingstone"
  expect_equal(decode(ciphertext), expected)
})
