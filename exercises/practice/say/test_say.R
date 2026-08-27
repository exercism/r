source("./say.R")
library(testthat)

test_that("zero", {
  expect_equal(
    say(0),
    "zero")
})

test_that("one", {
  expect_equal(
    say(1),
    "one")
})

test_that("fourteen", {
  expect_equal(
    say(14),
    "fourteen")
})

test_that("twenty", {
  expect_equal(
    say(20),
    "twenty")
})

test_that("twenty-two", {
  expect_equal(
    say(22),
    "twenty-two")
})

test_that("thirty", {
  expect_equal(
    say(30),
    "thirty")
})

test_that("ninety-nine", {
  expect_equal(
    say(99),
    "ninety-nine")
})

test_that("one hundred", {
  expect_equal(
    say(100),
    "one hundred")
})

test_that("one hundred twenty-three", {
  expect_equal(
    say(123),
    "one hundred twenty-three")
})

test_that("two hundred", {
  expect_equal(
    say(200),
    "two hundred")
})

test_that("nine hundred ninety-nine", {
  expect_equal(
    say(999),
    "nine hundred ninety-nine")
})

test_that("one thousand", {
  expect_equal(
    say(1000),
    "one thousand")
})

test_that("one thousand two hundred thirty-four", {
  expect_equal(
    say(1234),
    "one thousand two hundred thirty-four")
})

test_that("one million", {
  expect_equal(
    say(1000000),
    "one million")
})

test_that("one million two thousand three hundred forty-five", {
  expect_equal(
    say(1002345),
    "one million two thousand three hundred forty-five")
})

test_that("one billion", {
  expect_equal(
    say(1000000000),
    "one billion")
})

test_that("a big number", {
  expect_equal(
    say(987654321123),
    "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three") # nolint
})

test_that("numbers below zero are out of range", {
  expect_error(say(-1), "input out of range")
})

test_that("numbers above 999,999,999,999 are out of range", {
  expect_error(say(1000000000000),
    "input out of range")
})
