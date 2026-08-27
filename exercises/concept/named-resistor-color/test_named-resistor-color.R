source("./named-resistor-color.R")
library(testthat)

# 1. Define a named vector

test_that("1. Define the named vector resistor_values", {
  expect_length(resistor_bands, 10)
  expected_names <- c("black", "brown",
                      "red", "orange",
                      "yellow", "green",
                      "blue", "violet",
                      "grey", "white")
  expect_named(resistor_bands, expected_names)
  expect_equal(order(resistor_bands), 1:10)
})

# 2. The `band_value` function

test_that("2. band_value returns the correct value", {
  expect_equal(band_value("black"), 0)
  expect_equal(band_value("red"), 2)
  expect_equal(band_value("green"), 5)
  expect_equal(band_value("white"), 9)
})

# 3. The `two_band_value` function

test_that("3. two_band_value returns the correct value", {
  expect_equal(two_band_value(c("yellow", "red")), 42)
  expect_equal(two_band_value(c("orange", "brown")), 31)
  expect_equal(two_band_value(c("grey", "blue")), 86)
  expect_equal(two_band_value(c("violet", "green")), 75)
  expect_equal(two_band_value(c("black", "white")), 9)
})

# 4. The `ohms` function

test_that("4. ohms returns the correct value", {
  expect_equal(ohms(c("yellow", "red", "black")), 42)
  expect_equal(ohms(c("green", "white", "red")), 5900)
  expect_equal(ohms(c("red", "brown", "orange")), 21000)
  expect_equal(ohms(c("blue", "orange", "green")), 6300000)
})
