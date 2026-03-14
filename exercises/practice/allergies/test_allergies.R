# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/allergies/canonical-data.json
# File last updated on 2026-03-14

source("./allergies.R")
library(testthat)


# testing for eggs allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "eggs"))
})

test_that("allergic only to eggs", {
  allergies <- allergy(1)
  expect_true(allergic_to(allergies, "eggs"))
})

test_that("allergic to eggs and something else", {
  allergies <- allergy(3)
  expect_true(allergic_to(allergies, "eggs"))
})

test_that("allergic to something, but not eggs", {
  allergies <- allergy(2)
  expect_false(allergic_to(allergies, "eggs"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "eggs"))
})


# testing for peanuts allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "peanuts"))
})

test_that("allergic only to peanuts", {
  allergies <- allergy(2)
  expect_true(allergic_to(allergies, "peanuts"))
})

test_that("allergic to peanuts and something else", {
  allergies <- allergy(7)
  expect_true(allergic_to(allergies, "peanuts"))
})

test_that("allergic to something, but not peanuts", {
  allergies <- allergy(5)
  expect_false(allergic_to(allergies, "peanuts"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "peanuts"))
})


# testing for shellfish allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "shellfish"))
})

test_that("allergic only to shellfish", {
  allergies <- allergy(4)
  expect_true(allergic_to(allergies, "shellfish"))
})

test_that("allergic to shellfish and something else", {
  allergies <- allergy(14)
  expect_true(allergic_to(allergies, "shellfish"))
})

test_that("allergic to something, but not shellfish", {
  allergies <- allergy(10)
  expect_false(allergic_to(allergies, "shellfish"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "shellfish"))
})


# testing for strawberries allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "strawberries"))
})

test_that("allergic only to strawberries", {
  allergies <- allergy(8)
  expect_true(allergic_to(allergies, "strawberries"))
})

test_that("allergic to strawberries and something else", {
  allergies <- allergy(28)
  expect_true(allergic_to(allergies, "strawberries"))
})

test_that("allergic to something, but not strawberries", {
  allergies <- allergy(20)
  expect_false(allergic_to(allergies, "strawberries"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "strawberries"))
})


# testing for tomatoes allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "tomatoes"))
})

test_that("allergic only to tomatoes", {
  allergies <- allergy(16)
  expect_true(allergic_to(allergies, "tomatoes"))
})

test_that("allergic to tomatoes and something else", {
  allergies <- allergy(56)
  expect_true(allergic_to(allergies, "tomatoes"))
})

test_that("allergic to something, but not tomatoes", {
  allergies <- allergy(40)
  expect_false(allergic_to(allergies, "tomatoes"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "tomatoes"))
})


# testing for chocolate allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "chocolate"))
})

test_that("allergic only to chocolate", {
  allergies <- allergy(32)
  expect_true(allergic_to(allergies, "chocolate"))
})

test_that("allergic to chocolate and something else", {
  allergies <- allergy(112)
  expect_true(allergic_to(allergies, "chocolate"))
})

test_that("allergic to something, but not chocolate", {
  allergies <- allergy(80)
  expect_false(allergic_to(allergies, "chocolate"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "chocolate"))
})


# testing for pollen allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "pollen"))
})

test_that("allergic only to pollen", {
  allergies <- allergy(64)
  expect_true(allergic_to(allergies, "pollen"))
})

test_that("allergic to pollen and something else", {
  allergies <- allergy(224)
  expect_true(allergic_to(allergies, "pollen"))
})

test_that("allergic to something, but not pollen", {
  allergies <- allergy(160)
  expect_false(allergic_to(allergies, "pollen"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "pollen"))
})


# testing for cats allergy

test_that("not allergic to anything", {
  allergies <- allergy(0)
  expect_false(allergic_to(allergies, "cats"))
})

test_that("allergic only to cats", {
  allergies <- allergy(128)
  expect_true(allergic_to(allergies, "cats"))
})

test_that("allergic to cats and something else", {
  allergies <- allergy(192)
  expect_true(allergic_to(allergies, "cats"))
})

test_that("allergic to something, but not cats", {
  allergies <- allergy(64)
  expect_false(allergic_to(allergies, "cats"))
})

test_that("allergic to everything", {
  allergies <- allergy(255)
  expect_true(allergic_to(allergies, "cats"))
})


# list when:

test_that("no allergies", {
  allergies <- allergy(0)
  expect_true(setequal(
    list_allergies(allergies),
    c()
  ))
})

test_that("just eggs", {
  allergies <- allergy(1)
  expect_true(setequal(
    list_allergies(allergies),
    c('eggs')
  ))
})

test_that("just peanuts", {
  allergies <- allergy(2)
  expect_true(setequal(
    list_allergies(allergies),
    c('peanuts')
  ))
})

test_that("just strawberries", {
  allergies <- allergy(8)
  expect_true(setequal(
    list_allergies(allergies),
    c('strawberries')
  ))
})

test_that("eggs and peanuts", {
  allergies <- allergy(3)
  expect_true(setequal(
    list_allergies(allergies),
    c('eggs', 'peanuts')
  ))
})

test_that("more than eggs but not peanuts", {
  allergies <- allergy(5)
  expect_true(setequal(
    list_allergies(allergies),
    c('eggs', 'shellfish')
  ))
})

test_that("lots of stuff", {
  allergies <- allergy(248)
  expect_true(setequal(
    list_allergies(allergies),
    c('strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats')
  ))
})

test_that("everything", {
  allergies <- allergy(255)
  expect_true(setequal(
    list_allergies(allergies),
    c(
      'eggs',
      'peanuts',
      'shellfish',
      'strawberries',
      'tomatoes',
      'chocolate',
      'pollen',
      'cats'
    )
  ))
})

test_that("no allergen score parts", {
  allergies <- allergy(509)
  expect_true(setequal(
    list_allergies(allergies),
    c(
      'eggs',
      'shellfish',
      'strawberries',
      'tomatoes',
      'chocolate',
      'pollen',
      'cats'
    )
  ))
})

test_that("no allergen score parts without highest valid score", {
  allergies <- allergy(257)
  expect_true(setequal(
    list_allergies(allergies),
    c('eggs')
  ))
})
