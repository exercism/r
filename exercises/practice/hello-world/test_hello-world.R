source("./hello-world.R")
library(testthat)

test_that("no name", {
  expect_equal(hello_world(), "Hello, World!")
})
