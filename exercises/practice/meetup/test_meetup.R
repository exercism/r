# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/meetup/canonical-data.json
# File last updated on 2026-04-21

source("./meetup.R")
library(testthat)

test_that("when teenth Monday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 5
  week <- "teenth"
  day_of_week <- "Monday"
  expected <- "2013-05-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Monday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 8
  week <- "teenth"
  day_of_week <- "Monday"
  expected <- "2013-08-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Monday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 9
  week <- "teenth"
  day_of_week <- "Monday"
  expected <- "2013-09-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Tuesday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 3
  week <- "teenth"
  day_of_week <- "Tuesday"
  expected <- "2013-03-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Tuesday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 4
  week <- "teenth"
  day_of_week <- "Tuesday"
  expected <- "2013-04-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Tuesday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 8
  week <- "teenth"
  day_of_week <- "Tuesday"
  expected <- "2013-08-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Wednesday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 1
  week <- "teenth"
  day_of_week <- "Wednesday"
  expected <- "2013-01-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Wednesday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 2
  week <- "teenth"
  day_of_week <- "Wednesday"
  expected <- "2013-02-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Wednesday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 6
  week <- "teenth"
  day_of_week <- "Wednesday"
  expected <- "2013-06-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Thursday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 5
  week <- "teenth"
  day_of_week <- "Thursday"
  expected <- "2013-05-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Thursday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 6
  week <- "teenth"
  day_of_week <- "Thursday"
  expected <- "2013-06-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Thursday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 9
  week <- "teenth"
  day_of_week <- "Thursday"
  expected <- "2013-09-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Friday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 4
  week <- "teenth"
  day_of_week <- "Friday"
  expected <- "2013-04-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Friday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 8
  week <- "teenth"
  day_of_week <- "Friday"
  expected <- "2013-08-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Friday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 9
  week <- "teenth"
  day_of_week <- "Friday"
  expected <- "2013-09-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Saturday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 2
  week <- "teenth"
  day_of_week <- "Saturday"
  expected <- "2013-02-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Saturday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 4
  week <- "teenth"
  day_of_week <- "Saturday"
  expected <- "2013-04-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Saturday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 10
  week <- "teenth"
  day_of_week <- "Saturday"
  expected <- "2013-10-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Sunday is the 19th, the last day of the teenth week", {
  year <- 2013
  month <- 5
  week <- "teenth"
  day_of_week <- "Sunday"
  expected <- "2013-05-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Sunday is some day in the middle of the teenth week", {
  year <- 2013
  month <- 6
  week <- "teenth"
  day_of_week <- "Sunday"
  expected <- "2013-06-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when teenth Sunday is the 13th, the first day of the teenth week", {
  year <- 2013
  month <- 10
  week <- "teenth"
  day_of_week <- "Sunday"
  expected <- "2013-10-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Monday is some day in the middle of the first week", {
  year <- 2013
  month <- 3
  week <- "first"
  day_of_week <- "Monday"
  expected <- "2013-03-04"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Monday is the 1st, the first day of the first week", {
  year <- 2013
  month <- 4
  week <- "first"
  day_of_week <- "Monday"
  expected <- "2013-04-01"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Tuesday is the 7th, the last day of the first week", {
  year <- 2013
  month <- 5
  week <- "first"
  day_of_week <- "Tuesday"
  expected <- "2013-05-07"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Tuesday is some day in the middle of the first week", {
  year <- 2013
  month <- 6
  week <- "first"
  day_of_week <- "Tuesday"
  expected <- "2013-06-04"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Wednesday is some day in the middle of the first week", {
  year <- 2013
  month <- 7
  week <- "first"
  day_of_week <- "Wednesday"
  expected <- "2013-07-03"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Wednesday is the 7th, the last day of the first week", {
  year <- 2013
  month <- 8
  week <- "first"
  day_of_week <- "Wednesday"
  expected <- "2013-08-07"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Thursday is some day in the middle of the first week", {
  year <- 2013
  month <- 9
  week <- "first"
  day_of_week <- "Thursday"
  expected <- "2013-09-05"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Thursday is another day in the middle of the first week", {
  year <- 2013
  month <- 10
  week <- "first"
  day_of_week <- "Thursday"
  expected <- "2013-10-03"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Friday is the 1st, the first day of the first week", {
  year <- 2013
  month <- 11
  week <- "first"
  day_of_week <- "Friday"
  expected <- "2013-11-01"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Friday is some day in the middle of the first week", {
  year <- 2013
  month <- 12
  week <- "first"
  day_of_week <- "Friday"
  expected <- "2013-12-06"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Saturday is some day in the middle of the first week", {
  year <- 2013
  month <- 1
  week <- "first"
  day_of_week <- "Saturday"
  expected <- "2013-01-05"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Saturday is another day in the middle of the first week", {
  year <- 2013
  month <- 2
  week <- "first"
  day_of_week <- "Saturday"
  expected <- "2013-02-02"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Sunday is some day in the middle of the first week", {
  year <- 2013
  month <- 3
  week <- "first"
  day_of_week <- "Sunday"
  expected <- "2013-03-03"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Sunday is the 7th, the last day of the first week", {
  year <- 2013
  month <- 4
  week <- "first"
  day_of_week <- "Sunday"
  expected <- "2013-04-07"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Monday is some day in the middle of the second week", {
  year <- 2013
  month <- 3
  week <- "second"
  day_of_week <- "Monday"
  expected <- "2013-03-11"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Monday is the 8th, the first day of the second week", {
  year <- 2013
  month <- 4
  week <- "second"
  day_of_week <- "Monday"
  expected <- "2013-04-08"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Tuesday is the 14th, the last day of the second week", {
  year <- 2013
  month <- 5
  week <- "second"
  day_of_week <- "Tuesday"
  expected <- "2013-05-14"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Tuesday is some day in the middle of the second week", {
  year <- 2013
  month <- 6
  week <- "second"
  day_of_week <- "Tuesday"
  expected <- "2013-06-11"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Wednesday is some day in the middle of the second week", {
  year <- 2013
  month <- 7
  week <- "second"
  day_of_week <- "Wednesday"
  expected <- "2013-07-10"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Wednesday is the 14th, the last day of the second week", {
  year <- 2013
  month <- 8
  week <- "second"
  day_of_week <- "Wednesday"
  expected <- "2013-08-14"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Thursday is some day in the middle of the second week", {
  year <- 2013
  month <- 9
  week <- "second"
  day_of_week <- "Thursday"
  expected <- "2013-09-12"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Thursday is another day in the middle of the second week", {
  year <- 2013
  month <- 10
  week <- "second"
  day_of_week <- "Thursday"
  expected <- "2013-10-10"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Friday is the 8th, the first day of the second week", {
  year <- 2013
  month <- 11
  week <- "second"
  day_of_week <- "Friday"
  expected <- "2013-11-08"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Friday is some day in the middle of the second week", {
  year <- 2013
  month <- 12
  week <- "second"
  day_of_week <- "Friday"
  expected <- "2013-12-13"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Saturday is some day in the middle of the second week", {
  year <- 2013
  month <- 1
  week <- "second"
  day_of_week <- "Saturday"
  expected <- "2013-01-12"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Saturday is another day in the middle of the second week", {
  year <- 2013
  month <- 2
  week <- "second"
  day_of_week <- "Saturday"
  expected <- "2013-02-09"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Sunday is some day in the middle of the second week", {
  year <- 2013
  month <- 3
  week <- "second"
  day_of_week <- "Sunday"
  expected <- "2013-03-10"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when second Sunday is the 14th, the last day of the second week", {
  year <- 2013
  month <- 4
  week <- "second"
  day_of_week <- "Sunday"
  expected <- "2013-04-14"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Monday is some day in the middle of the third week", {
  year <- 2013
  month <- 3
  week <- "third"
  day_of_week <- "Monday"
  expected <- "2013-03-18"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Monday is the 15th, the first day of the third week", {
  year <- 2013
  month <- 4
  week <- "third"
  day_of_week <- "Monday"
  expected <- "2013-04-15"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Tuesday is the 21st, the last day of the third week", {
  year <- 2013
  month <- 5
  week <- "third"
  day_of_week <- "Tuesday"
  expected <- "2013-05-21"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Tuesday is some day in the middle of the third week", {
  year <- 2013
  month <- 6
  week <- "third"
  day_of_week <- "Tuesday"
  expected <- "2013-06-18"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Wednesday is some day in the middle of the third week", {
  year <- 2013
  month <- 7
  week <- "third"
  day_of_week <- "Wednesday"
  expected <- "2013-07-17"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Wednesday is the 21st, the last day of the third week", {
  year <- 2013
  month <- 8
  week <- "third"
  day_of_week <- "Wednesday"
  expected <- "2013-08-21"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Thursday is some day in the middle of the third week", {
  year <- 2013
  month <- 9
  week <- "third"
  day_of_week <- "Thursday"
  expected <- "2013-09-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Thursday is another day in the middle of the third week", {
  year <- 2013
  month <- 10
  week <- "third"
  day_of_week <- "Thursday"
  expected <- "2013-10-17"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Friday is the 15th, the first day of the third week", {
  year <- 2013
  month <- 11
  week <- "third"
  day_of_week <- "Friday"
  expected <- "2013-11-15"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Friday is some day in the middle of the third week", {
  year <- 2013
  month <- 12
  week <- "third"
  day_of_week <- "Friday"
  expected <- "2013-12-20"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Saturday is some day in the middle of the third week", {
  year <- 2013
  month <- 1
  week <- "third"
  day_of_week <- "Saturday"
  expected <- "2013-01-19"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Saturday is another day in the middle of the third week", {
  year <- 2013
  month <- 2
  week <- "third"
  day_of_week <- "Saturday"
  expected <- "2013-02-16"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Sunday is some day in the middle of the third week", {
  year <- 2013
  month <- 3
  week <- "third"
  day_of_week <- "Sunday"
  expected <- "2013-03-17"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when third Sunday is the 21st, the last day of the third week", {
  year <- 2013
  month <- 4
  week <- "third"
  day_of_week <- "Sunday"
  expected <- "2013-04-21"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Monday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 3
  week <- "fourth"
  day_of_week <- "Monday"
  expected <- "2013-03-25"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Monday is the 22nd, the first day of the fourth week", {
  year <- 2013
  month <- 4
  week <- "fourth"
  day_of_week <- "Monday"
  expected <- "2013-04-22"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Tuesday is the 28th, the last day of the fourth week", {
  year <- 2013
  month <- 5
  week <- "fourth"
  day_of_week <- "Tuesday"
  expected <- "2013-05-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Tuesday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 6
  week <- "fourth"
  day_of_week <- "Tuesday"
  expected <- "2013-06-25"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Wednesday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 7
  week <- "fourth"
  day_of_week <- "Wednesday"
  expected <- "2013-07-24"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Wednesday is the 28th, the last day of the fourth week", {
  year <- 2013
  month <- 8
  week <- "fourth"
  day_of_week <- "Wednesday"
  expected <- "2013-08-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Thursday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 9
  week <- "fourth"
  day_of_week <- "Thursday"
  expected <- "2013-09-26"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Thursday is another day in the middle of the fourth week", {
  year <- 2013
  month <- 10
  week <- "fourth"
  day_of_week <- "Thursday"
  expected <- "2013-10-24"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Friday is the 22nd, the first day of the fourth week", {
  year <- 2013
  month <- 11
  week <- "fourth"
  day_of_week <- "Friday"
  expected <- "2013-11-22"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Friday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 12
  week <- "fourth"
  day_of_week <- "Friday"
  expected <- "2013-12-27"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Saturday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 1
  week <- "fourth"
  day_of_week <- "Saturday"
  expected <- "2013-01-26"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Saturday is another day in the middle of the fourth week", {
  year <- 2013
  month <- 2
  week <- "fourth"
  day_of_week <- "Saturday"
  expected <- "2013-02-23"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Sunday is some day in the middle of the fourth week", {
  year <- 2013
  month <- 3
  week <- "fourth"
  day_of_week <- "Sunday"
  expected <- "2013-03-24"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when fourth Sunday is the 28th, the last day of the fourth week", {
  year <- 2013
  month <- 4
  week <- "fourth"
  day_of_week <- "Sunday"
  expected <- "2013-04-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Monday in a month with four Mondays", {
  year <- 2013
  month <- 3
  week <- "last"
  day_of_week <- "Monday"
  expected <- "2013-03-25"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Monday in a month with five Mondays", {
  year <- 2013
  month <- 4
  week <- "last"
  day_of_week <- "Monday"
  expected <- "2013-04-29"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Tuesday in a month with four Tuesdays", {
  year <- 2013
  month <- 5
  week <- "last"
  day_of_week <- "Tuesday"
  expected <- "2013-05-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Tuesday in another month with four Tuesdays", {
  year <- 2013
  month <- 6
  week <- "last"
  day_of_week <- "Tuesday"
  expected <- "2013-06-25"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Wednesday in a month with five Wednesdays", {
  year <- 2013
  month <- 7
  week <- "last"
  day_of_week <- "Wednesday"
  expected <- "2013-07-31"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Wednesday in a month with four Wednesdays", {
  year <- 2013
  month <- 8
  week <- "last"
  day_of_week <- "Wednesday"
  expected <- "2013-08-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Thursday in a month with four Thursdays", {
  year <- 2013
  month <- 9
  week <- "last"
  day_of_week <- "Thursday"
  expected <- "2013-09-26"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Thursday in a month with five Thursdays", {
  year <- 2013
  month <- 10
  week <- "last"
  day_of_week <- "Thursday"
  expected <- "2013-10-31"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Friday in a month with five Fridays", {
  year <- 2013
  month <- 11
  week <- "last"
  day_of_week <- "Friday"
  expected <- "2013-11-29"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Friday in a month with four Fridays", {
  year <- 2013
  month <- 12
  week <- "last"
  day_of_week <- "Friday"
  expected <- "2013-12-27"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Saturday in a month with four Saturdays", {
  year <- 2013
  month <- 1
  week <- "last"
  day_of_week <- "Saturday"
  expected <- "2013-01-26"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Saturday in another month with four Saturdays", {
  year <- 2013
  month <- 2
  week <- "last"
  day_of_week <- "Saturday"
  expected <- "2013-02-23"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Sunday in a month with five Sundays", {
  year <- 2013
  month <- 3
  week <- "last"
  day_of_week <- "Sunday"
  expected <- "2013-03-31"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Sunday in a month with four Sundays", {
  year <- 2013
  month <- 4
  week <- "last"
  day_of_week <- "Sunday"
  expected <- "2013-04-28"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when last Wednesday in February in a leap year is the 29th", {
  year <- 2012
  month <- 2
  week <- "last"
  day_of_week <- "Wednesday"
  expected <- "2012-02-29"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("last Wednesday in December that is also the last day of the year", {
  year <- 2014
  month <- 12
  week <- "last"
  day_of_week <- "Wednesday"
  expected <- "2014-12-31"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when last Sunday in February in a non-leap year is not the 29th", {
  year <- 2015
  month <- 2
  week <- "last"
  day_of_week <- "Sunday"
  expected <- "2015-02-22"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})

test_that("when first Friday is the 7th, the last day of the first week", {
  year <- 2012
  month <- 12
  week <- "first"
  day_of_week <- "Friday"
  expected <- "2012-12-07"
  expect_equal(meetup(year, month, week, day_of_week), expected)
})
