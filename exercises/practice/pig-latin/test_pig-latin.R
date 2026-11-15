# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/pig-latin/canonical-data.json
# File last updated on 2026-11-15

source("./pig-latin.R")
library(testthat)


# ay is added to words that start with vowels
test_that("", {
  expect_equal(translate("apple"), "appleay")
})

test_that("", {
  expect_equal(translate("ear"), "earay")
})

test_that("", {
  expect_equal(translate("igloo"), "iglooay")
})

test_that("", {
  expect_equal(translate("object"), "objectay")
})

test_that("", {
  expect_equal(translate("under"), "underay")
})

test_that("", {
  expect_equal(translate("equal"), "equalay")
})

# first letter and ay are moved to the end of words that start with consonants
test_that("", {
  expect_equal(translate("pig"), "igpay")
})

test_that("", {
  expect_equal(translate("koala"), "oalakay")
})

test_that("", {
  expect_equal(translate("xenon"), "enonxay")
})

test_that("", {
  expect_equal(translate("qat"), "atqay")
})

test_that("", {
  expect_equal(translate("liquid"), "iquidlay")
})

# some letter clusters are treated like a single consonant
test_that("", {
  expect_equal(translate("chair"), "airchay")
})

test_that("", {
  expect_equal(translate("queen"), "eenquay")
})

test_that("", {
  expect_equal(translate("square"), "aresquay")
})

test_that("", {
  expect_equal(translate("therapy"), "erapythay")
})

test_that("", {
  expect_equal(translate("thrush"), "ushthray")
})

test_that("", {
  expect_equal(translate("school"), "oolschay")
})

# some letter clusters are treated like a single vowel
test_that("", {
  expect_equal(translate("yttria"), "yttriaay")
})

test_that("", {
  expect_equal(translate("xray"), "xrayay")
})

# position of y in a word determines if it is a consonant or a vowel
test_that("", {
  expect_equal(translate("yellow"), "ellowyay")
})

test_that("", {
  expect_equal(translate("rhythm"), "ythmrhay")
})

test_that("", {
  expect_equal(translate("my"), "ymay")
})

# phrases are translated
test_that("", {
  expect_equal(translate("why do squids enjoy xrays"), "ywhay oday idssquay enjoyay xraysay")
})
