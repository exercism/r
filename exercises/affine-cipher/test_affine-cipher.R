source("./affine-cipher.R")
library(testthat)

# check encrypt() function
test_that("encrypt() returns correct string", {
  expect_identical(encrypt("test", 5, 7), "ybty")
})

test_that("encrypt() accounts for whitespace", {
  expect_identical(encrypt("te st ", 5, 7), "ybty")
})

test_that("encrypt() accounts for case-sensitivity", {
  expect_identical(encrypt("TeST", 5, 7), "ybty")
})

test_that("encrypt() checks that a is coprime with m", {
  expect_error(encrypt("jknkasd", 18, 13))
})

# check decrypt() function
test_that("decrypt() returns correct string", {
  expect_identical(decrypt("ybty", 5, 7), "test")
  expect_identical(
    decrypt("kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx", 19, 13),
    "thequickbrownfoxjumpsoverthelazydog"
    )
})

test_that("decrypt() accounts for whitespace", {
  expect_identical(decrypt(" ybt y", 5, 7), "test")
  expect_identical(
    decrypt("kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx", 19, 13),
    "thequickbrownfoxjumpsoverthelazydog"
    )
})

test_that("decrypt() checks that a is coprime with m", {
  expect_error(decrypt("jknkasd", 18, 13))
})

message("All tests passed for exercise: affine-cipher")
