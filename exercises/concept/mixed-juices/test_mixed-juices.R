source("./mixed-juices.R")
library(testthat)

# time_to_mix_juice

test_that("1. Returns the correct time for 'Pure Strawberry Joy'.", {
  expect_equal(time_to_mix_juice("Pure Strawberry Joy"), 0.5)
})

test_that("1. Returns the correct time for 'Energizer'.", {
  expect_equal(time_to_mix_juice("Energizer"), 1.5)
})

test_that("1. Returns the correct time for Green Garden'.", {
  expect_equal(time_to_mix_juice("Green Garden"), 1.5)
})

test_that("1. Returns the correct time for 'Tropical Island'.", {
  expect_equal(time_to_mix_juice("Tropical Island"), 3)
})

test_that("1. Returns the correct time for 'All or Nothing'.", {
  expect_equal(time_to_mix_juice("All or Nothing"), 5)
})

test_that("1. Returns the default time for all other juices.", {
  default_time <- 2.5
  expect_equal(time_to_mix_juice("Limetime"), default_time)
  expect_equal(time_to_mix_juice("Manic Organic"), default_time)
  expect_equal(time_to_mix_juice("Papaya & Peach"), default_time)
})

# limes_to_cut

test_that("2. Calculates the number of limes needed to reach the target supply, with 8 available.", { # nolint
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

test_that("2. Calculates the number of limes needed to reach the target supply, with 2 available.", { # nolint
  limes <- c(
    "medium",
    "small"
  )
  expect_equal(limes_to_cut(4, limes), 1)
})

test_that("2. Uses up all limes if there are not enough to reach the target, with 7 available.", {
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

test_that("2. If no new wedges are needed, no limes are cut.", {
  limes <- c(
    "small",
    "large",
    "medium"
  )
  expect_equal(limes_to_cut(0, limes), 0)
})

test_that("2. Works if no limes are available.", {
  limes <- c()
  expect_equal(limes_to_cut(10, limes), 0)
})

# order_times

test_that("3. Correctly determines the times for 5 current orders.", {
  orders <- c(
    "Tropical Island",
    "Energizer",
    "Limetime",
    "All or Nothing",
    "Pure Strawberry Joy"
  )
  expected <- "^\\[1\\] 3\\n\\[1\\] 1.5\\n\\[1\\] 2.5\\n\\[1\\] 5\\n\\[1\\] 0.5$" # nolint
  expect_output(order_times(orders), expected)
})

test_that("3. Correctly determines the times for 9 current orders.", {
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
  expected <- "^\\[1\\] 0.5\\n\\[1\\] 0.5\\n\\[1\\] 2.5\\n\\[1\\] 3\\n\\[1\\] 5\\n\\[1\\] 5\\n\\[1\\] 5\\n\\[1\\] 1.5\\n\\[1\\] 2.5$" # nolint
  expect_output(order_times(orders), expected)
})

test_that("3. Correctly returns an empty list if there are no orders.", {
  orders <- c()
  expect_silent(order_times(orders))
})


# remaining_orders

test_that("4. Correctly determines the remaining orders from a queue of 5.", {
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

test_that("4. Correctly determines the remaining orders from a queue of 9.", {
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

test_that("4. Counts all orders as fulfilled if there is enough time.", {
  orders <- c(
    "Energizer",
    "Green Garden",
    "Ruby Glow",
    "Pure Strawberry Joy",
    "Tropical Island",
    "Limetime"
  )
  expect_length(remaining_orders(12, orders), 0)
})

test_that("4. Works if there is only very little time left.", {
  orders <- c("Bananas Gone Wild", "Pure Strawberry Joy")
  expected <- c("Pure Strawberry Joy")
  expect_equal(remaining_orders(0.2, orders), expected)
})
