# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/reverse-string/canonical-data.json
# File last updated on 2026-03-12

source("./reverse-string.R")
library(testthat)

test_that("an empty string", {
  expect_equal(reverse(""), "")
})

test_that("a word", {
  expect_equal(reverse("robot"), "tobor")
})

test_that("a capitalized word", {
  expect_equal(reverse("Ramen"), "nemaR")
})

test_that("a sentence with punctuation", {
  expect_equal(reverse("I'm hungry!"), "!yrgnuh m'I")
})

test_that("a palindrome", {
  expect_equal(reverse("racecar"), "racecar")
})

test_that("an even-sized word", {
  expect_equal(reverse("drawer"), "reward")
})

test_that("wide characters", {
  expect_equal(reverse("子猫"), "猫子")
})

if (exists("enable_grapheme_clusters") && enable_grapheme_clusters) {
  test_that("grapheme cluster with pre-combined form", {
    expect_equal(reverse("Würstchenstand"), "dnatsnehctsrüW")
  })
}

if (exists("enable_grapheme_clusters") && enable_grapheme_clusters) {
  test_that("grapheme clusters", {
    expect_equal(reverse("ผู้เขียนโปรแกรม"), "มรกแรปโนยขีเผู้")
  })
}
