source("./name-badges.R")
library(testthat)

# 1) print_name_badge

test_that("prints the employee badge with full data", {
  id <- 455
  name <- "Mary M. Brown"
  department <- "MARKETING"
  expected <- "[455] - Mary M. Brown - MARKETING"
  expect_equal(print_name_badge(id, name, department), expected)
})

test_that("uppercases the department", {
  id <- 89
  name <- "Jack McGregor"
  department <- "Procurement"
  expected <- "[89] - Jack McGregor - PROCUREMENT"
  expect_equal(print_name_badge(id, name, department), expected)
})

test_that("prints the employee badge without id", {
  id <- NA
  name <- "Barbara White"
  department <- "SECURITY"
  expected <- "Barbara White - SECURITY"
  expect_equal(print_name_badge(id, name, department), expected)
})

test_that("prints the owner badge", {
  id <- 1
  name <- "Anna Johnson"
  department <- NULL
  expected <- "[1] - Anna Johnson - OWNER"
  expect_equal(print_name_badge(id, name, department), expected)
})

test_that("prints the owner badge without id", {
  id <- NA
  name <- "Stephen Dann"
  department <- NULL
  expected <- "Stephen Dann - OWNER"
  expect_equal(print_name_badge(id, name, department), expected)
})

# salaries_no_id

test_that("sums salaries for employees without ID", {
  ids <- c(201, 217, NA, 352, 102, NA, 263)
  salaries <- c(19, 23, 42, 29, 65, 122, 54)
  expect_equal(salaries_no_id(ids, salaries), 164)
})

test_that("sums salaries but no employees without ID", {
  ids <- c(201, 217, 47, 352, 102, 163, 263)
  salaries <- c(25, 27, 44, 26, 63, 122, 34)
  expect_equal(salaries_no_id(ids, salaries), 0)
})
