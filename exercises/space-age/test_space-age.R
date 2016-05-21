source('./space-age.R')
suppressPackageStartupMessages({ require(testthat) })

test_that("Age on Earth", {
  seconds <- 1000000000
  expect_equal(space_age(seconds),
    31.69
  )
})

test_that("Age on Mercury", {
  seconds <- 2213483568
  expect_equal(space_age(seconds),
    280.88
  )
})

test_that("Age on Venus", {
  seconds <- 189839836
  expect_equal(space_age(seconds),
    9.78
  )
})

test_that("Age on Mars", {
  seconds <- 2329871239
  expect_equal(space_age(seconds),
    39.25
  )
})

test_that("Age on Jupiter", {
  seconds <- 901876382
  expect_equal(space_age(seconds),
    2.41
  )
})

test_that("Age on Saturn", {
  seconds <- 3000000000
  expect_equal(space_age(seconds),
    3.23
  )
})

test_that("Age on Uranus", {
  seconds <- 3210123456
  expect_equal(space_age(seconds),
    1.21
  )
})

test_that("Age on Neptune", {
  seconds <- 8210123456
  expect_equal(space_age(seconds),
    1.58
  )
})

print("All tests passed!")
