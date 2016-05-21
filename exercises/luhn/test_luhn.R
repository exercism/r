source('./luhn.R')
suppressPackageStartupMessages({ require(testthat) })

test_that("check digit", {
  input <- 34567
  expect_equal(check_digit(input),
    7
  )
})

test_that("check digit with input ending in zero", {
  input <- 91370
  expect_equal(check_digit(input),
    0
  )
})

test_that("check addends", {
  input <- 12121
  expect_equal(addends(input),
    c(1,4,1,4,1)
  )
})

test_that("check too large addends", {
  input <- 8631
  expect_equal(addends(input),
    c(7,6,6,1)
  )
})

test_that("checksum", {
  input <- 4913
  expect_equal(checksum(input),
    22
  )
})

test_that("checksum of larger number", {
  input <- 201773
  expect_equal(checksum(input),
    21
  )
})

test_that("check invalid number", {
  input <- 738
  expect_equal(is_valid(input),
    FALSE
  )
})

test_that("check valid number", {
  input <- 8739567
  expect_equal(is_valid(input),
    TRUE
  )
})

test_that("create valid number", {
  input <- 123
  expect_equal(luhn(input),
    1230
  )
})

test_that("create larger valid number", {
  input <- 873956
  expect_equal(luhn(input),
    8739567
  )
})

test_that("create even larger valid number", {
  input <- 837263756
  expect_equal(luhn(input),
    8372637564
  )
})

print("All tests passed!")
