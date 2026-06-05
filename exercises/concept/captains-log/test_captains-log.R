source("./captains-log.R")
library(testthat)
library(purrr)

# Many of these tests check properties of the result, rather than precise values
# With a big enough sample size (set in repeats variable),
#  the rate of false fails should be extremely low

# 1) random_planet_class

repeats <- 1000
planetary_classes <- c("D", "H", "J", "K", "L", "M", "N", "R", "T", "Y")

test_that("1. all generated planets are valid, small list", {
  expect_all_true(random_planet_class(5) %in% planetary_classes)
})

test_that("1. all generated planets are valid, with duplicates needed", {
  expect_all_true(random_planet_class(repeats) %in% planetary_classes)
})

test_that("1. most valid planets classes are generated", {
  expect_true(sum(planetary_classes %in% random_planet_class(repeats)) >= 8)
})

# 2) random_ship_registry_number

reg_repeats <- 1000
random_registry <- replicate(reg_repeats, random_ship_registry_number())

test_that("2. all registry numbers are the correct length", {
  expect_all_true(nchar(random_registry) == 8)
})

test_that("2. all registry numbers have the correct prefix", {
  expect_all_true(substr(random_registry, 1, 4) == "NCC-")
})

test_that("2. all registry numbers have the correct numeric range", {
  nums <- strtoi(substr(random_registry, 5, 8))
  expect_all_true(nums >= 1000 & nums <= 9999)
})

# 3) shuffle starship fleet

starships <- replicate(100, random_ship_registry_number()) |> unique()

test_that("3. starships are taken from the input list", {
  expect_all_true(shuffle_starships(starships) |> map_lgl(\(s) all(s %in% starships)))
})

test_that("3. all chosen starships are unique", {
  expect_equal(length(shuffle_starships(starships)), length(starships))
})

test_that("3. starships are chosen at random", {
  expect_true(sum(shuffle_starships(starships) == starships) <= 4)
})

# 4) random_stardate

stardate_repeats <- 1000
random_stardates <- replicate(stardate_repeats, random_stardate())

test_that("4. all stardates have the correct numeric range", {
  expect_all_true(random_stardates >= 41000.0 & random_stardates <= 42000.0)
})

test_that("4. stardates are not all similar", {
  n_small <- sum(random_stardates < 41333)
  n_mid <- sum(41333 <= random_stardates & random_stardates < 41667)
  n_large <- sum(random_stardates >= 41667)
  n_expected <- length(random_stardates) / 3

  uniform_if <- sum((c(n_small, n_mid, n_large) - n_expected) ^ 2) / n_expected
  expect_lt(uniform_if, 10)
})
