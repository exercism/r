# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/atbash-cipher/canonical-data.json
# File last updated on 2026-03-16

source("./atbash-cipher.R")
library(testthat)


# encode

test_that("encode yes", {
  plaintext <- "yes"
  expected <- "bvh"
  expect_equal(encode(plaintext), expected)
})

test_that("encode no", {
  plaintext <- "no"
  expected <- "ml"
  expect_equal(encode(plaintext), expected)
})

test_that("encode OMG", {
  plaintext <- "OMG"
  expected <- "lnt"
  expect_equal(encode(plaintext), expected)
})

test_that("encode spaces", {
  plaintext <- "O M G"
  expected <- "lnt"
  expect_equal(encode(plaintext), expected)
})

test_that("encode mindblowingly", {
  plaintext <- "mindblowingly"
  expected <- "nrmwy oldrm tob"
  expect_equal(encode(plaintext), expected)
})

test_that("encode numbers", {
  plaintext <- "Testing,1 2 3, testing."
  expected <- "gvhgr mt123 gvhgr mt"
  expect_equal(encode(plaintext), expected)
})

test_that("encode deep thought", {
  plaintext <- "Truth is fiction."
  expected <- "gifgs rhurx grlm"
  expect_equal(encode(plaintext), expected)
})

test_that("encode all the letters", {
  plaintext <- "The quick brown fox jumps over the lazy dog."
  expected <- "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  expect_equal(encode(plaintext), expected)
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
