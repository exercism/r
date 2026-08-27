source("./bird-watcher.R")
library(testthat)

# 1) today

test_that("1. Today for disappointing day", {
  birds_per_day <- c(0, 0, 1, 0, 0, 1, 0)
  expect_equal(today(birds_per_day), 0)
})

test_that("Today for busy day", {
  birds_per_day <- c(8, 8, 9, 5, 4, 7, 10)
  expect_equal(today(birds_per_day), 10)
})

# 2) increment_todays_count

test_that("2. Increment todays count with no previous visits", {
  birds_per_day <- c(0, 0, 0, 4, 2, 3, 0)
  expect_equal(
    increment_todays_count(birds_per_day),
    c(0, 0, 0, 4, 2, 3, 1)
  )
})

test_that("2. Increment todays count with multiple previous visits", {
  birds_per_day <- c(8, 8, 9, 2, 1, 6, 4)
  expect_equal(
    increment_todays_count(birds_per_day),
    c(8, 8, 9, 2, 1, 6, 5)
  )
})

# 3) has_day_without_birds

test_that("3. Has day without birds with day without birds", {
  birds_per_day <- c(5, 5, 4, 0, 7, 6, 7)
  expect_equal(has_day_without_birds(birds_per_day), TRUE)
})

test_that("Has day without birds with no day without birds", {
  birds_per_day <- c(4, 5, 9, 10, 9, 4, 3)
  expect_equal(has_day_without_birds(birds_per_day), FALSE)
})

# 4) count_for_first_days

test_that("4. Count for first three days of disappointing week", {
  birds_per_day <- c(0, 0, 1, 0, 0, 1, 0)
  expect_equal(count_for_first_days(birds_per_day, 3), 1)
})

test_that("4. Count for first six days of busy week", {
  birds_per_day <- c(5, 9, 12, 6, 8, 8, 17)
  expect_equal(count_for_first_days(birds_per_day, 6), 48)
})

# 5) busy_days

test_that("5. Busy days for disappointing week", {
  birds_per_day <- c(1, 1, 1, 0, 0, 0, 0)
  expect_equal(busy_days(birds_per_day), 0)
})

test_that("5. Busy days for busy week", {
  birds_per_day <- c(4, 9, 5, 7, 8, 8, 2)
  expect_equal(busy_days(birds_per_day), 5)
})

# 6) running_total

test_that("6. Calculate cumulative number of birds for the week", {
  birds_per_day <- c(2, 1, 1, 3, 0, 4, 10)
  result <- c(2, 3, 4, 7, 7, 11, 21)
  expect_equal(running_total(birds_per_day), result)
})

# 7) busy_days_of_week

test_that("6. Days in descending order of busyness, today is Wednesday", {
  birds_per_day <- c(2, 5, 1, 3, 0, 4, 10)
  day_names <- c("Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed")
  result <- c("Wed", "Fri", "Tue", "Sun", "Thu", "Sat", "Mon")
  expect_equal(busy_days_of_week(birds_per_day, day_names), result)
})


