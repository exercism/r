# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/pig-latin/canonical-data.json
# File last updated on 2026-11-15

source("./pig-latin.R")
library(testthat)


# ay is added to words that start with vowels
test_that("word beginning with a", {
  expect_equal(translate("apple"), "appleay")
})

test_that("word beginning with e", {
  expect_equal(translate("ear"), "earay")
})

test_that("word beginning with i", {
  expect_equal(translate("igloo"), "iglooay")
})

test_that("word beginning with o", {
  expect_equal(translate("object"), "objectay")
})

test_that("word beginning with u", {
  expect_equal(translate("under"), "underay")
})

test_that("word beginning with a vowel and followed by a qu", {
  expect_equal(translate("equal"), "equalay")
})

# first letter and ay are moved to the end of words that start with consonants
test_that("word beginning with p", {
  expect_equal(translate("pig"), "igpay")
})

test_that("word beginning with k", {
  expect_equal(translate("koala"), "oalakay")
})

test_that("word beginning with x", {
  expect_equal(translate("xenon"), "enonxay")
})

test_that("word beginning with q without a following u", {
  expect_equal(translate("qat"), "atqay")
})

test_that("word beginning with consonant and vowel containing qu", {
  expect_equal(translate("liquid"), "iquidlay")
})

# some letter clusters are treated like a single consonant
test_that("word beginning with ch", {
  expect_equal(translate("chair"), "airchay")
})

test_that("word beginning with qu", {
  expect_equal(translate("queen"), "eenquay")
})

test_that("word beginning with qu and a preceding consonant", {
  expect_equal(translate("square"), "aresquay")
})

test_that("word beginning with th", {
  expect_equal(translate("therapy"), "erapythay")
})

test_that("word beginning with thr", {
  expect_equal(translate("thrush"), "ushthray")
})

test_that("word beginning with sch", {
  expect_equal(translate("school"), "oolschay")
})

# some letter clusters are treated like a single vowel
test_that("word beginning with yt", {
  expect_equal(translate("yttria"), "yttriaay")
})

test_that("word beginning with xr", {
  expect_equal(translate("xray"), "xrayay")
})

# position of y in a word determines if it is a consonant or a vowel
test_that("y is treated like a consonant at the beginning of a word", {
  expect_equal(translate("yellow"), "ellowyay")
})

test_that("y is treated like a vowel at the end of a consonant cluster", {
  expect_equal(translate("rhythm"), "ythmrhay")
})

test_that("y as second letter in two letter word", {
  expect_equal(translate("my"), "ymay")
})

# phrases are translated
test_that("a whole phrase", {
  expect_equal(translate("why do squids enjoy xrays"), "ywhay oday idssquay enjoyay xraysay")
})
