source("./captains-log.R")
library(testthat)
library(purrr)

# Many of these tests check properties of the result, rather than precise values
# With a big enough sample size (set in repeats variable),
#  the rate of false fails should be extremely low

# 1) random_planet

repeats <- 1000
random_planets <- replicate(repeats, random_planet_class())
planetary_classes <- c("D", "H", "J", "K", "L", "M", "N", "R", "T", "Y")

test_that("1. all generated planets are valid", {
  expect_all_true(random_planets %in% planetary_classes)
})

test_that("1. all valid planets are generated", {
  expect_all_true(planetary_classes %in% random_planets)
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

# 3) random_stardate

stardate_repeats <- 1000
random_stardates <- replicate(stardate_repeats, random_stardate())

test_that("3. all stardates have the correct numeric range", {
  expect_all_true(random_stardates >= 41000.0 & random_stardates <= 42000.0)
})

# the next one could surely be improved
# test_that("3. registry numbers are not all similar", {
#   expect_true(any(random_stardates < 41500.0) & any(random_stardates > 41500.0))
# })

test_that("3. stardates are not all similar", {
  n_small <- sum(random_stardates < 41333)
  n_mid <- sum(41333 <= random_stardates & random_stardates < 41667)
  n_large <- sum(random_stardates >= 41667)
  n_expected <- length(random_stardates) / 3

  uniform_if <- sum((c(n_small, n_mid, n_large) - n_expected) ^ 2) / n_expected
  expect_lt(uniform_if, 10)
})

# 4) pick_starships

starships <- replicate(100, random_ship_registry_number()) |> unique()
desired_size <- sample(1:20)
chosen_starships <- lapply(desired_size, \(n) pick_starships(starships, n))

test_that("4. starships are taken from the input list", {
  expect_all_true(chosen_starships |> map_lgl(\(s) all(s %in% starships)))
})

test_that("4. all chosen starships are unique", {
  expect_all_true(chosen_starships |> map_lgl(\(s) length(s) == length(unique(s))))
})

test_that("4. all chosen starship fleets are of correct size", {
  expect_all_true(sapply(chosen_starships, length) == desired_size)
})

test_that("starships are chosen at random", {
  expect_all_true(sapply(chosen_starships, \(s) sum(s == starships[1:length(s)]) <= 4))
})
