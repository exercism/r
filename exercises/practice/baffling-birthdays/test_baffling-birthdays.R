# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/baffling-birthdays/canonical-data.json
# File last updated on 2026-03-26

source("./baffling-birthdays.R")
library(testthat)
library(lubridate)

# shared birthday
test_that("one birthdate", {
  input <- c('2000-01-01')
  expect_false(shared_birthday(input))
})
test_that("two birthdates with same year, month, and day", {
  input <- c('2000-01-01', '2000-01-01')
  expect_true(shared_birthday(input))
})
test_that("two birthdates with same year and month, but different day", {
  input <- c('2012-05-09', '2012-05-17')
  expect_false(shared_birthday(input))
})
test_that("two birthdates with same month and day, but different year", {
  input <- c('1999-10-23', '1988-10-23')
  expect_true(shared_birthday(input))
})
test_that("two birthdates with same year, but different month and day", {
  input <- c('2007-12-19', '2007-04-27')
  expect_false(shared_birthday(input))
})
test_that("two birthdates with different year, month, and day", {
  input <- c('1997-08-04', '1963-11-23')
  expect_false(shared_birthday(input))
})
test_that("multiple birthdates without shared birthday", {
  input <- c('1966-07-29', '1977-02-12', '2001-12-25', '1980-11-10')
  expect_false(shared_birthday(input))
})
test_that("multiple birthdates with one shared birthday", {
  input <- c('1966-07-29', '1977-02-12', '2001-07-29', '1980-11-10')
  expect_true(shared_birthday(input))
})
test_that("multiple birthdates with more than one shared birthday", {
  input <- c(
    '1966-07-29',
    '1977-02-12',
    '2001-12-25',
    '1980-07-29',
    '2019-02-12'
  )
  expect_true(shared_birthday(input))
})


# random birthdates

test_that("random birthdates generate requested number of birthdates", {
  expect_all_true(sapply(1:20, \(groupsize) {
    length(random_birthdates(groupsize)) == groupsize
  }))
})

test_that("random birthdates are not in leap years", {
  expect_all_false(leap_year(random_birthdates(100)))
})

test_that("random birthdates appear random", {
  birthdates <- random_birthdates(500)
  months <- month(birthdates) |> unique()
  days <- day(birthdates) |> unique()
  expect_gte(length(months), 10)
  expect_gte(length(days), 28)
})


# estimated probability of at least one shared birthday

test_that("for one person", {
  expected <- 0.0
  rtol <- ifelse(expected > 0.1 && expected < 0.9, 0.1, 0.01)
  expect_equal(
    estimate_probability_of_shared_birthday(1),
    expected,
    tolerance = rtol
  )
})

test_that("among ten people", {
  expected <- 0.11694818
  rtol <- ifelse(expected > 0.1 && expected < 0.9, 0.1, 0.01)
  expect_equal(
    estimate_probability_of_shared_birthday(10),
    expected,
    tolerance = rtol
  )
})

test_that("among twenty-three people", {
  expected <- 0.50729723
  rtol <- ifelse(expected > 0.1 && expected < 0.9, 0.1, 0.01)
  expect_equal(
    estimate_probability_of_shared_birthday(23),
    expected,
    tolerance = rtol
  )
})

test_that("among seventy people", {
  expected <- 0.99915958
  rtol <- ifelse(expected > 0.1 && expected < 0.9, 0.1, 0.01)
  expect_equal(
    estimate_probability_of_shared_birthday(70),
    expected,
    tolerance = rtol
  )
})
