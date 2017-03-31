source('./hello-world.R')
library(testthat)

test_that("no name", {
  expect_equal(hello_world(), "Hello, World!")
})

test_that("sample name", {
  expect_equal(hello_world("Alice"), "Hello, Alice!")
})

test_that("other sample name", {
  expect_equal(hello_world("Bob"), "Hello, Bob!")
})

print("All tests passed!")
