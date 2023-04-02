source("./anagram.R")
library(testthat)

context("anagram")

test_that("no matches", {
  subject <- "diaper"
  candidates <- c("hello", "world", "zombies", "pants")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("detects anagram", {
  subject <- "listen"
  candidates <- c("enlists", "google", "inlets", "banana")
  expect_equal(anagram(subject, candidates),
               c("inlets"))
})

test_that("detects multiple anagrams", {
  subject <- "allergy"
  candidates <-
    c("gallery", "ballerina", "regally", "clergy", "largely", "leading")
  expect_equal(anagram(subject, candidates),
               c("gallery", "regally", "largely"))
})

test_that("character overlap is disregarded", {
  subject <- "galea"
  candidates <- c("eagle")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("does not detect anagram subsets", {
  subject <- "good"
  candidates <- c("dog", "goody")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("does not detect indentical words", {
  subject <- "corn"
  candidates <- c("corn", "dark", "Corn", "rank", "CORN", "cron", "park")
  expect_equal(anagram(subject, candidates),
               c("cron"))
})

test_that("does not detect non-anagrams with identical checksum", {
  subject <- "mass"
  candidates <- c("last")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("detects anagrams using case-insensitve possible matches", {
  subject <- "orchestra"
  candidates <- c("cashregister", "Carthorse", "radishes")
  expect_equal(anagram(subject, candidates),
               c("Carthorse"))
})

test_that("does not detect a word as its own anagram", {
  subject <- "banana"
  candidates <- c("Banana")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("does not detect an anagram if the original word is repeated", {
  subject <- "go"
  candidates <- c("go Go GO")
  expect_equal(anagram(subject, candidates),
               c())
})

test_that("anagrams must use all letters exactly once", {
  subject <- "tapper"
  candidates <- c("patter")
  expect_equal(anagram(subject, candidates),
               c())
})

message("All tests passed for exercise: anagram")
