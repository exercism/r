source("./factory-sensors.R")
library(testthat)

# check_humidity_level

test_that("1. Should throw if the humidity percentage is 100", {
  expect_error(check_humidity_level(100), NULL)
})

test_that("1. Should not throw if the humidity percentage is 53", {
  expect_no_error(check_humidity_level(53))
  expect_message(check_humidity_level(53), "humidity test passed")
})

test_that("1. Should return TRUE if the humidity percentage is 53", {
  expect_true(check_humidity_level(53))
})

# report_overheating

test_that("2. Should not throw if the temperature is 200°C", {
  expect_true(report_overheating(200))
  expect_no_error(report_overheating(200))
  expect_message(report_overheating(200), "200")
})

test_that("2. Should throw an error if the temperature is NULL", {
  expect_error(report_overheating(NULL), "Sensor Broken")
})

test_that("2. Should issue a warning if the temperature is 501°C", {
  expect_warning(report_overheating(501), "501")
})

test_that("2. Should throw an error if the temperature is 601°C", {
  expect_error(report_overheating(601), "601")
})

# monitor_the_machine

test_that("3. Should report tests passing", {
  expect_message(monitor_the_machine(53, 200), "200")
  expect_message(monitor_the_machine(53, 200), "humidity test passed")
  expect_message(monitor_the_machine(53, 200), "All OK")
})
