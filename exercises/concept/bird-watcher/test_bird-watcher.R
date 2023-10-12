source("./bird-watcher.R")
library(testthat)

# 1) today

test_that("Today for disappointing day", {
  birds_per_day <- c(0, 0, 1, 0, 0, 1, 0)
  expect_equal(today(birds_per_day), 0)
})

test_that("Today for busy day", {
  birds_per_day <- c(8, 8, 9, 5, 4, 7, 10)
  expect_equal(today(birds_per_day), 10)
})

# 2) increment_todays_count

test_that("Increment todays count with no previous visits", {
  birds_per_day <- c(0, 0, 0, 4, 2, 3, 0)
  expect_equal(
    increment_todays_count(birds_per_day),
    c(0, 0, 0, 4, 2, 3, 1)
  )
})

test_that("Increment todays count with multiple previous visits", {
  birds_per_day <- c(8, 8, 9, 2, 1, 6, 4)
  expect_equal(
    increment_todays_count(birds_per_day),
    c(8, 8, 9, 2, 1, 6, 5)
  )
})

# 3) has_day_without_birds

test_that("Has day without birds with day without birds", {
  birds_per_day <- c(5, 5, 4, 0, 7, 6, 7)
  expect_equal(has_day_without_birds(birds_per_day), TRUE)
})

test_that("Has day without birds with no day without birds", {
  birds_per_day <- c(4, 5, 9, 10, 9, 4, 3)
  expect_equal(has_day_without_birds(birds_per_day), FALSE)
})

# 4) count_for_first_days

test_that("Count for first three days of disappointing week", {
  birds_per_day <- c(0, 0, 1, 0, 0, 1, 0)
  expect_equal(count_for_first_days(birds_per_day, 3), 1)
})

test_that("Count for first six days of busy week", {
  birds_per_day <- c(5, 9, 12, 6, 8, 8, 17)
  expect_equal(count_for_first_days(birds_per_day, 6), 48)
})

# 5) busy_days

test_that("Busy days for disappointing week", {
  birds_per_day <- c(1, 1, 1, 0, 0, 0, 0)
  expect_equal(busy_days(birds_per_day), 0)
})

test_that("Busy days for busy week", {
  birds_per_day <- c(4, 9, 5, 7, 8, 8, 2)
  expect_equal(busy_days(birds_per_day), 5)
})
