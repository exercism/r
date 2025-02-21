source("./complex-numbers.R")
library(testthat)

# Real part

test_that("Real part of a purely real number", {
  z <- create(1.0, 0.0)
  expect_equal(real(z), 1.0)
})

test_that("Real part of a purely imaginary number", {
  z <- create(0.0, 1.0)
  expect_equal(real(z), 0.0)
})

test_that("Real part of a number with real and imaginary part", {
  z <- create(1.0, 2.0)
  expect_equal(real(z), 1.0)
})

# Imaginary part

test_that("Imaginary part of a purely real number", {
  z <- create(1.0, 0.0)
  expect_equal(imag(z), 0.0)
})

test_that("Imaginary part of a purely imaginary number", {
  z <- create(0.0, 1.0)
  expect_equal(imag(z), 1.0)
})

test_that("Imaginary part of a number with real and imaginary part", {
  z <- create(1.0, 2.0)
  expect_equal(imag(z), 2.0)
})

test_that("Imaginary unit", {
  z1 <- create(0, 1.0)
  z2 <- create(0, 1.0)
  expect_equal(multiply(z1, z2), create(-1.0, 0.0))
})

# Arithmetic

# Addition
test_that("Add purely real numbers", {
  z1 <- create(1.0, 0.0)
  z2 <- create(2.0, 0.0)
  expect_equal(add(z1, z2), create(3.0, 0.0))
})

test_that("Add purely imaginary numbers", {
  z1 <- create(0.0, 1.0)
  z2 <- create(0.0, 2.0)
  expect_equal(add(z1, z2), create(0.0, 3.0))
})

test_that("Add numbers with real and imaginary part", {
  z1 <- create(1.0, 2.0)
  z2 <- create(3.0, 4.0)
  expect_equal(add(z1, z2), create(4.0, 6.0))
})

# Subtraction
test_that("Subtract purely real numbers", {
  z1 <- create(1.0, 0.0)
  z2 <- create(2.0, 0.0)
  expect_equal(subtract(z1, z2), create(-1.0, 0.0))
})

test_that("Subtract purely imaginary numbers", {
  z1 <- create(0.0, 1.0)
  z2 <- create(0.0, 2.0)
  expect_equal(subtract(z1, z2), create(0.0, -1.0))
})

test_that("Subtract numbers with real and imaginary part", {
  z1 <- create(1.0, 2.0)
  z2 <- create(3.0, 4.0)
  expect_equal(subtract(z1, z2), create(-2.0, -2.0))
})

# Multiplication
test_that("Multiply purely real numbers", {
  z1 <- create(1.0, 0.0)
  z2 <- create(2.0, 0.0)
  expect_equal(multiply(z1, z2), create(2.0, 0.0), tolerance = 1e-4)
})

test_that("Multiply purely imaginary numbers", {
  z1 <- create(0.0, 1.0)
  z2 <- create(0.0, 2.0)
  expect_equal(multiply(z1, z2), create(-2.0, 0.0), tolerance = 1e-4)
})

test_that("Multiply numbers with real and imaginary part", {
  z1 <- create(1.0, 2.0)
  z2 <- create(3.0, 4.0)
  expect_equal(multiply(z1, z2), create(-5.0, 10.0), tolerance = 1e-4)
})

# Division
test_that("Divide purely real numbers", {
  z1 <- create(1.0, 0.0)
  z2 <- create(2.0, 0.0)
  expect_equal(divide(z1, z2), create(0.5, 0.0), tolerance = 1e-4)
})

test_that("Divide purely imaginary numbers", {
  z1 <- create(0.0, 1.0)
  z2 <- create(0.0, 2.0)
  expect_equal(divide(z1, z2), create(0.5, 0.0), tolerance = 1e-4)
})

test_that("Divide numbers with real and imaginary part", {
  z1 <- create(1.0, 2.0)
  z2 <- create(3.0, 4.0)
  expect_equal(divide(z1, z2), create(0.44, 0.08), tolerance = 1e-4)
})

# Absolute value
test_that("Absolute value of a positive purely real number", {
  z <- create(5.0, 0.0)
  expect_equal(absolute(z), 5.0, tolerance = 1e-4)
})

test_that("Absolute value of a negative purely real number", {
  z <- create(-5.0, 0.0)
  expect_equal(absolute(z), 5.0, tolerance = 1e-4)
})

test_that("Absolute value of a purely imag number with positive imag part", {
  z <- create(0.0, 5.0)
  expect_equal(absolute(z), 5.0, tolerance = 1e-4)
})

test_that("Absolute value of a purely imag number with negative imag part", {
  z <- create(0.0, -5.0)
  expect_equal(absolute(z), 5.0, tolerance = 1e-4)
})

test_that("Absolute value of a number with real and imaginary part", {
  z <- create(3.0, 4.0)
  expect_equal(absolute(z), 5.0, tolerance = 1e-4)
})

# Complex conjugate
test_that("Conjugate a purely real number", {
  z <- create(5.0, 0.0)
  expect_equal(conjugate(z), create(5.0, 0.0), tolerance = 1e-4)
})

test_that("Conjugate a purely imaginary number", {
  z <- create(0.0, 5.0)
  expect_equal(conjugate(z), create(0.0, -5.0), tolerance = 1e-4)
})

test_that("Conjugate a number with real and imaginary part", {
  z <- create(1.0, 1.0)
  expect_equal(conjugate(z), create(1.0, -1.0), tolerance = 1e-4)
})

# Exponential
test_that("Euler's identity/formula", {
  z <- create(0.0, pi)
  expect_equal(exponential(z), create(-1.0, 0.0), tolerance = 1e-4)
})

test_that("Exponential of 0", {
  z <- create(0.0, 0.0)
  expect_equal(exponential(z), create(1.0, 0.0), tolerance = 1e-4)
})

test_that("Exponential of a purely real number", {
  z <- create(1.0, 0.0)
  expect_equal(exponential(z), create(exp(1), 0.0), tolerance = 1e-4)
})

test_that("Exponential of a number with real and imaginary part", {
  z <- create(log(2), pi)
  expect_equal(exponential(z), create(-2.0, 0.0), tolerance = 1e-4)
})

test_that("Exponential resulting in a number with real and imaginary part", {
  z <- create(log(2) / 2, pi / 4)
  expect_equal(exponential(z), create(1.0, 1.0), tolerance = 1e-4)
})

# Operations between real numbers and complex numbers
test_that("Add real number to complex number", {
  z1 <- create(1.0, 2.0)
  z2 <- 5.0
  expect_equal(add(z1, z2), create(6.0, 2.0), tolerance = 1e-4)
})

test_that("Add complex number to real number", {
  z1 <- 5.0
  z2 <- create(1.0, 2.0)
  expect_equal(add(z1, z2), create(6.0, 2.0), tolerance = 1e-4)
})

test_that("Subtract real number from complex number", {
  z1 <- create(5.0, 7.0)
  z2 <- 4.0
  expect_equal(subtract(z1, z2), create(1.0, 7.0), tolerance = 1e-4)
})

test_that("Subtract complex number from real number", {
  z1 <- 4.0
  z2 <- create(5.0, 7.0)
  expect_equal(subtract(z1, z2), create(-1.0, -7.0), tolerance = 1e-4)
})

test_that("Multiply complex number by real number", {
  z1 <- create(2.0, 5.0)
  z2 <- 5.0
  expect_equal(multiply(z1, z2), create(10.0, 25.0), tolerance = 1e-4)
})

test_that("Multiply real number by complex number", {
  z1 <- 5.0
  z2 <- create(2.0, 5.0)
  expect_equal(multiply(z1, z2), create(10.0, 25.0), tolerance = 1e-4)
})

test_that("Divide complex number by real number", {
  z1 <- create(10.0, 100.0)
  z2 <- 10.0
  expect_equal(divide(z1, z2), create(1.0, 10.0))
})

test_that("Divide real number by complex number", {
  z1 <- 5.0
  z2 <- create(1.0, 1.0)
  expect_equal(divide(z1, z2), create(2.5, -2.5), tolerance = 1e-4)
})


message("All tests passed for exercise: complex-numbers")
