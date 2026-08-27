source("./booking-up-for-beauty.R")
library(testthat)

test_that("1. Parse all-number appointment date", {
  expect_equal(schedule_appointment("7/25/2019 13:45:00"), make_datetime(2019, 07, 25, 13, 45, 0))
  expect_equal(schedule_appointment("7/8/2021 8:00:00"), make_datetime(2021, 07, 08, 8, 00, 0))
})

test_that("2. Check if an appointment has already passed", {
  expect_true(has_passed(now() - years(1) + hours(2)))
  expect_true(has_passed(now() - months(8)))
  expect_true(has_passed(now() - days(23)))
  expect_true(has_passed(now() - minutes(55)))
  expect_true(has_passed(now() - minutes(1)))
  expect_false(has_passed(now() + minutes(1)))
  expect_false(has_passed(now() + days(19)))
  expect_false(has_passed(now() + months(10)))
  expect_false(has_passed(now() + years(2) + months(3) + days(6)))
})

test_that("3. Check if appointment is in the afternoon", {
  expect_false(is_afternoon_appointment(make_datetime(2019, 6, 17, 8, 15, 0)))
  expect_false(is_afternoon_appointment(make_datetime(2019, 2, 23, 11, 59, 59)))
  expect_true(is_afternoon_appointment(make_datetime(2019, 8, 9, 12, 0, 0)))
  expect_true(is_afternoon_appointment(make_datetime(2019, 8, 9, 12, 0, 1)))
  expect_true(is_afternoon_appointment(make_datetime(2019, 9, 1, 17, 59, 59)))
  expect_false(is_afternoon_appointment(make_datetime(2019, 9, 1, 18, 0, 0)))
  expect_false(is_afternoon_appointment(make_datetime(2019, 9, 1, 23, 59, 59)))
})

test_that("4. Check the day of the week for an appointment", {
  expect_equal(day_of_week(make_datetime(2019, 07, 25, 13, 45, 0)), 4)
  expect_equal(day_of_week(make_datetime(2021, 07, 10, 8, 00, 0)), 6)
  expect_equal(day_of_week(make_datetime(2026, 06, 01, 10, 30, 0)), 1)
  expect_equal(day_of_week(make_datetime(2026, 08, 28, 14, 45, 0)), 5)
})

test_that("5. Reschedule an appointment", {
  expect_equal(reschedule("7/25/2019 13:45:00"), make_datetime(2019, 07, 26, 13, 45, 0))
  expect_equal(reschedule("7/10/2021 8:00:00"), make_datetime(2021, 07, 16, 8, 00, 0))
  expect_equal(reschedule("6/1/2026 10:30:00"), make_datetime(2026, 06, 05, 10, 30, 0))
  expect_equal(reschedule("8/28/2026 14:45:00"), make_datetime(2026, 09, 04, 14, 45, 0))
})
