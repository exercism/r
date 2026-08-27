# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/bottle-song/canonical-data.json
# File last updated on 2026-03-12

source("./bottle-song.R")
library(testthat)


# single verse

test_that("first generic verse", {
  start_bottles <- 10
  take_down <- 1
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Ten green bottles hanging on the wall,",
      "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall."
    )
  )
})

test_that("last generic verse", {
  start_bottles <- 3
  take_down <- 1
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Three green bottles hanging on the wall,",
      "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall."
    )
  )
})

test_that("verse with 2 bottles", {
  start_bottles <- 2
  take_down <- 1
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Two green bottles hanging on the wall,",
      "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall."
    )
  )
})

test_that("verse with 1 bottle", {
  start_bottles <- 1
  take_down <- 1
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "One green bottle hanging on the wall,",
      "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall."
    )
  )
})


# multiple verses

test_that("first two verses", {
  start_bottles <- 10
  take_down <- 2
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Ten green bottles hanging on the wall,",
      "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.",
      "",
      "Nine green bottles hanging on the wall,",
      "Nine green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be eight green bottles hanging on the wall."
    )
  )
})

test_that("last three verses", {
  start_bottles <- 3
  take_down <- 3
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Three green bottles hanging on the wall,",
      "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.",
      "",
      "Two green bottles hanging on the wall,",
      "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.",
      "",
      "One green bottle hanging on the wall,",
      "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall."
    )
  )
})

test_that("all verses", {
  start_bottles <- 10
  take_down <- 10
  expect_equal(
    recite(start_bottles, take_down),
    paste(
      sep = "\n",
      "Ten green bottles hanging on the wall,",
      "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.",
      "",
      "Nine green bottles hanging on the wall,",
      "Nine green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be eight green bottles hanging on the wall.",
      "",
      "Eight green bottles hanging on the wall,",
      "Eight green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be seven green bottles hanging on the wall.",
      "",
      "Seven green bottles hanging on the wall,",
      "Seven green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be six green bottles hanging on the wall.",
      "",
      "Six green bottles hanging on the wall,",
      "Six green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be five green bottles hanging on the wall.",
      "",
      "Five green bottles hanging on the wall,",
      "Five green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be four green bottles hanging on the wall.",
      "",
      "Four green bottles hanging on the wall,",
      "Four green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be three green bottles hanging on the wall.",
      "",
      "Three green bottles hanging on the wall,",
      "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.",
      "",
      "Two green bottles hanging on the wall,",
      "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.",
      "",
      "One green bottle hanging on the wall,",
      "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall."
    )
  )
})
