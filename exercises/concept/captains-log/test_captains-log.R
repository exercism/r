source("./captains-log.R")
library(testthat)

# 1) random_planet

repeats <- 1000
random_planets <- vector(length = repeats)
for (i in 1:repeats) random_planets[i] <- random_planet()
planetary_classes <- c("D", "H", "J", "K", "L", "M", "N", "R", "T", "Y")

test_that("all generated planets are valid", {
  expect_equal(all(random_planets %in% planetary_classes), TRUE)
})

test_that("all valid planets are generated", {
  expect_equal(all(planetary_classes %in% random_planets), TRUE)
})

# 2) random_ship_registry_number

reg_repeats <- 100
random_registry <- vector(length = reg_repeats)
for (i in 1:reg_repeats) random_registry[i] <- random_ship_registry_number()

test_that("all registry numbers are the correct length", {
  expect_equal(all(nchar(random_registry) == 8), TRUE)
})

test_that("all registry numbers have the correct prefix", {
  expect_equal(all(substr(random_registry, 1, 4) == "NCC-"), TRUE)
})

test_that("all registry numbers have the correct numeric range", {
  nums <- strtoi(substr(random_registry, 5, 8))
  expect_equal(all(nums >= 1000 & nums <= 9999), TRUE)
})

# 3) random_stardate

stardate_repeats <- 100
random_stardates <- vector(length = stardate_repeats)
for (i in 1:stardate_repeats) random_stardates[i] <- random_stardate()

test_that("all stardates have the correct numeric range", {
  expect_equal(all(random_stardates >= 41000.0 &
    random_stardates <= 42000.0), TRUE)
})

# the next one could surely be improved
test_that("registry numbers are not all similar", {
  expect_equal(any(random_stardates < 41500.0) &
    any(random_stardates > 41500.0), TRUE)
})
