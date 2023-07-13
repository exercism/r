source("./blackjack.R")
library(testthat)

# 1) parse_card

test_that("parse ace", {
  expect_equal(parse_card("ace"), 11)
})

test_that("parse two", {
  expect_equal(parse_card("two"), 2)
})

test_that("parse three", {
  expect_equal(parse_card("three"), 3)
})

test_that("parse four", {
  expect_equal(parse_card("four"), 4)
})

test_that("parse five", {
  expect_equal(parse_card("five"), 5)
})

test_that("parse six", {
  expect_equal(parse_card("six"), 6)
})

test_that("parse seven", {
  expect_equal(parse_card("seven"), 7)
})

test_that("parse eight", {
  expect_equal(parse_card("eight"), 8)
})

test_that("parse nine", {
  expect_equal(parse_card("nine"), 9)
})

test_that("parse ten", {
  expect_equal(parse_card("ten"), 10)
})

test_that("parse jack", {
  expect_equal(parse_card("jack"), 10)
})

test_that("parse queen", {
  expect_equal(parse_card("queen"), 10)
})

test_that("parse king", {
  expect_equal(parse_card("king"), 10)
})

test_that("parse other", {
  expect_equal(parse_card("joker"), 0)
})

# first_turn

test_that("pair of aces", {
  expect_equal(first_turn("ace", "ace", "ace"), "P")
})

test_that("pair of jacks", {
  expect_equal(first_turn("jack", "jack", "ace"), "S")
})

test_that("pair of kings", {
  expect_equal(first_turn("king", "king", "ace"), "S")
})

test_that("pair of twos", {
  expect_equal(first_turn("two", "two", "ace"), "H")
})

test_that("pair of fives", {
  expect_equal(first_turn("five", "five", "ace"), "H")
})

test_that("blackjack with ace for dealer", {
  expect_equal(first_turn("ace", "jack", "ace"), "S")
})

test_that("blackjack with queen for dealer", {
  expect_equal(first_turn("king", "ace", "queen"), "S")
})

test_that("blackjack with five for dealer", {
  expect_equal(first_turn("ace", "ten", "five"), "W")
})

test_that("blackjack with nine for dealer", {
  expect_equal(first_turn("ace", "king", "nine"), "W")
})

test_that("score of 20", {
  expect_equal(first_turn("ten", "king", "ace"), "S")
})

test_that("score of 19", {
  expect_equal(first_turn("ten", "nine", "ace"), "S")
})

test_that("score of 18", {
  expect_equal(first_turn("ten", "eight", "ace"), "S")
})

test_that("score of 17", {
  expect_equal(first_turn("seven", "king", "ace"), "S")
})

test_that("score of 16 with six for dealer", {
  expect_equal(first_turn("ten", "six", "six"), "S")
})

test_that("score of 16 with seven for dealer", {
  expect_equal(first_turn("ten", "six", "seven"), "H")
})

test_that("score of 16 with ace for dealer", {
  expect_equal(first_turn("ten", "six", "ace"), "H")
})

test_that("score of 15 with six for dealer", {
  expect_equal(first_turn("ten", "five", "six"), "S")
})

test_that("score of 15 with seven for dealer", {
  expect_equal(first_turn("ten", "five", "seven"), "H")
})

test_that("score of 15 with king for dealer", {
  expect_equal(first_turn("ten", "five", "king"), "H")
})

test_that("score of 14 with six for dealer", {
  expect_equal(first_turn("ten", "four", "six"), "S")
})

test_that("score of 14 with seven for dealer", {
  expect_equal(first_turn("ten", "four", "seven"), "H")
})

test_that("score of 14 with queen for dealer", {
  expect_equal(first_turn("ten", "four", "queen"), "H")
})

test_that("score of 13 with six for dealer", {
  expect_equal(first_turn("ten", "three", "six"), "S")
})

test_that("score of 13 with seven for dealer", {
  expect_equal(first_turn("ten", "three", "seven"), "H")
})

test_that("score of 13 with queen for dealer", {
  expect_equal(first_turn("ten", "three", "queen"), "H")
})

test_that("score of 12 with six for dealer", {
  expect_equal(first_turn("ten", "two", "six"), "S")
})

test_that("score of 12 with seven for dealer", {
  expect_equal(first_turn("ten", "two", "seven"), "H")
})

test_that("score of 12 with queen for dealer", {
  expect_equal(first_turn("ten", "two", "queen"), "H")
})

test_that("score of 11 with queen for dealer", {
  expect_equal(first_turn("nine", "two", "queen"), "H")
})

test_that("score of 10 with two for dealer", {
  expect_equal(first_turn("eight", "two", "two"), "H")
})

test_that("score of 5 with queen for dealer", {
  expect_equal(first_turn("three", "two", "queen"), "H")
})

test_that("score of 4 with five for dealer", {
  expect_equal(first_turn("two", "two", "five"), "H")
})
