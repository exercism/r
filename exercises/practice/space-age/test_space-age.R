# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/space-age/canonical-data.json
# File last updated on 2026-03-11

source("./space-age.R")
library(testthat)

test_that("age on Earth", {
  seconds <- 1000000000
  expect_equal(space_age(seconds, "earth"), 31.69)
})

test_that("age on Mercury", {
  seconds <- 2134835688
  expect_equal(space_age(seconds, "mercury"), 280.88)
})

test_that("age on Venus", {
  seconds <- 189839836
  expect_equal(space_age(seconds, "venus"), 9.78)
})

test_that("age on Mars", {
  seconds <- 2129871239
  expect_equal(space_age(seconds, "mars"), 35.88)
})

test_that("age on Jupiter", {
  seconds <- 901876382
  expect_equal(space_age(seconds, "jupiter"), 2.41)
})

test_that("age on Saturn", {
  seconds <- 2000000000
  expect_equal(space_age(seconds, "saturn"), 2.15)
})

test_that("age on Uranus", {
  seconds <- 1210123456
  expect_equal(space_age(seconds, "uranus"), 0.46)
})

test_that("age on Neptune", {
  seconds <- 1821023456
  expect_equal(space_age(seconds, "neptune"), 0.35)
})
