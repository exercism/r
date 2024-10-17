source("./mixed-juices.R")
library(testthat)

# time_to_mix_juice

test_that("returns the correct time for 'Pure Strawberry Joy'", {
  expect_equal(time_to_mix_juice("Pure Strawberry Joy"), 0.5)
})

test_that("returns the correct time for 'Energizer'", {
  expect_equal(time_to_mix_juice("Energizer"), 1.5)
})

test_that("returns the correct time for Green Garden'", {
  expect_equal(time_to_mix_juice("Green Garden"), 1.5)
})

test_that("returns the correct time for 'Tropical Island'", {
  expect_equal(time_to_mix_juice("Tropical Island"), 3)
})

test_that("returns the correct time for 'All or Nothing'", {
  expect_equal(time_to_mix_juice("All or Nothing"), 5)
})

test_that("returns the default time for all other juices", {
  default_time <- 2.5
  expect_equal(time_to_mix_juice("Limetime"), default_time)
  expect_equal(time_to_mix_juice("Manic Organic"), default_time)
  expect_equal(time_to_mix_juice("Papaya & Peach"), default_time)
})

# limes_to_cut

test_that("calculates the number of limes needed to reach the target supply", {
  limes <- c(
    "small",
    "large",
    "large",
    "medium",
    "small",
    "large",
    "large",
    "medium"
  )
  expect_equal(limes_to_cut(42, limes), 6)
})

test_that("calculates the number of limes needed to reach the target supply", {
  limes <- c(
    "medium",
    "small"
  )
  expect_equal(limes_to_cut(4, limes), 1)
})

test_that("uses up all limes if there are not enough to reach the target", {
  limes <- c(
    "small",
    "large",
    "large",
    "medium",
    "small",
    "large",
    "large"
  )
  expect_equal(limes_to_cut(80, limes), 7)
})

test_that("if no new wedges are needed, no limes are cut", {
  limes <- c(
    "small",
    "large",
    "medium"
  )
  expect_equal(limes_to_cut(0, limes), 0)
})

test_that("works if no limes are available", {
  limes <- c()
  expect_equal(limes_to_cut(10, limes), 0)
})

# order_times

test_that("correctly determines the times for current orders", {
  orders <- c(
    "Tropical Island",
    "Energizer",
    "Limetime",
    "All or Nothing",
    "Pure Strawberry Joy"
  )
  expected <- c(3.0, 1.5, 2.5, 5.0, 0.5)
  expect_equal(order_times(orders), expected)
})

test_that("correctly determines the times for current orders", {
  orders <- c(
    "Pure Strawberry Joy",
    "Pure Strawberry Joy",
    "Vitality",
    "Tropical Island",
    "All or Nothing",
    "All or Nothing",
    "All or Nothing",
    "Green Garden",
    "Limetime"
  )
  expected <- c(0.5, 0.5, 2.5, 3.0, 5.0, 5.0, 5.0, 1.5, 2.5)
  expect_equal(order_times(orders), expected)
})

test_that("correctly returns an empty list if there are no orders", {
  orders <- c()
  expect_equal(length(order_times(orders)), 0)
})


# remaining_orders

test_that("correctly determines the remaining orders", {
  orders <- c(
    "Tropical Island",
    "Energizer",
    "Limetime",
    "All or Nothing",
    "Pure Strawberry Joy"
  )
  expected <- c("All or Nothing", "Pure Strawberry Joy")
  expect_equal(remaining_orders(7, orders), expected)
})

test_that("correctly determines the remaining orders", {
  orders <- c(
    "Pure Strawberry Joy",
    "Pure Strawberry Joy",
    "Vitality",
    "Tropical Island",
    "All or Nothing",
    "All or Nothing",
    "All or Nothing",
    "Green Garden",
    "Limetime"
  )
  expected <- c("All or Nothing", "Green Garden", "Limetime")
  expect_equal(remaining_orders(13, orders), expected)
})

test_that("counts all orders as fulfilled if there is enough time", {
  orders <- c(
    "Energizer",
    "Green Garden",
    "Ruby Glow",
    "Pure Strawberry Joy",
    "Tropical Island",
    "Limetime"
  )
  expect_equal(length(remaining_orders(12, orders)), 0)
})

test_that("works if there is only very little time left", {
  orders <- c("Bananas Gone Wild", "Pure Strawberry Joy")
  expected <- c("Pure Strawberry Joy")
  expect_equal(remaining_orders(0.2, orders), expected)
})
