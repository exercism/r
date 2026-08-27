source("./variable-length-quantity.R")
library(testthat)

test_that("encode zero", {
  expect_equal(encode(0), 0)
})

test_that("encode arbitrary single byte", {
  expect_equal(encode(64), 64)
})

test_that("encode largest single byte", {
  expect_equal(encode(127), 127)
})

test_that("encode smallest double byte", {
  expect_equal(encode(128), c(129, 0))
})

test_that("encode arbitrary double byte", {
  expect_equal(encode(8192), c(192, 0))
})

test_that("encode largest double byte", {
  expect_equal(encode(16383), c(255, 127))
})

test_that("encode smallest triple byte", {
  expect_equal(encode(16384), c(129, 128, 0))
})

test_that("encode arbitrary triple byte", {
  expect_equal(encode(1048576), c(192, 128, 0))
})

test_that("encode largest triple byte", {
  expect_equal(encode(2097151), c(255, 255, 127))
})

test_that("encode smallest quadruple byte", {
  expect_equal(encode(2097152), c(129, 128, 128, 0))
})

test_that("encode arbitrary quadruple byte", {
  expect_equal(encode(134217728), c(192, 128, 128, 0))
})

test_that("encode largest quadruple byte", {
  expect_equal(encode(268435455), c(255, 255, 255, 127))
})

test_that("encode smallest quintuple byte", {
  expect_equal(encode(268435456), c(129, 128, 128, 128, 0))
})

test_that("encode maximum 32-bit integer", {
  expect_equal(encode(4294967295), c(143, 255, 255, 255, 127))
})

test_that("encode two single-byte values", {
  expect_equal(encode(c(64, 127)), c(64, 127))
})

test_that("encode two multi-byte values", {
  expect_equal(encode(c(16384, 1193046)), c(129, 128, 0, 200, 232, 86))
})

test_that("encode many multi-byte values", {
  expect_equal(
    encode(
      c(8192, 1193046, 268435455, 0, 16383, 16384)),
      c(192, 0, 200, 232, 86, 255, 255, 255, 127, 0, 255, 127, 129, 128, 0))
})

test_that("decode one byte", {
  expect_equal(decode(127), 127)
})

test_that("decode two bytes", {
  expect_equal(decode(c(192, 0)), 8192)
})

test_that("decode three bytes", {
  expect_equal(decode(c(255, 255, 127)), 2097151)
})

test_that("decode four bytes", {
  expect_equal(decode(c(129, 128, 128, 0)), 2097152)
})

test_that("decode maximum 32-bit integer", {
  expect_equal(decode(c(143, 255, 255, 255, 127)), 4294967295)
})

test_that("decoding incomplete sequence causes error", {
  expect_error(decode(c(255)))
})

test_that("decoding incomplete sequence causes error, even if value is zero", {
  expect_error(decode(c(128)))
})

test_that("decode multiple values", {
  expect_equal(
    decode(
      c(192, 0, 200, 232, 86, 255, 255, 255, 127, 0, 255, 127, 129, 128, 0)),
      c(8192, 1193046, 268435455, 0, 16383, 16384))
})

