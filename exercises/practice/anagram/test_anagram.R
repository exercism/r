source("./anagram.R")
library(testthat)

test_that("no matches", {
  subject <- "diaper"
  candidates <- c("hello", "world", "zombies", "pants")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("detects simple anagram", {
  subject <- "ant"
  candidates <- c("tan", "stand", "at")
  expect_equal(
    anagram(subject, candidates),
    c("tan")
  )
})

test_that("does not detect false positives", {
  subject <- "galea"
  candidates <- c("eagle")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("detects two anagrams", {
  subject <- "solemn"
  candidates <- c("lemons", "cherry", "melons")
  expect_equal(
    anagram(subject, candidates),
    c("lemons", "melons")
  )
})

test_that("does not detect anagram subsets", {
  subject <- "good"
  candidates <- c("dog", "goody")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("detects anagram", {
  subject <- "listen"
  candidates <- c("enlists", "google", "inlets", "banana")
  expect_equal(
    anagram(subject, candidates),
    c("inlets")
  )
})

test_that("detects three anagrams", {
  subject <- "allergy"
  candidates <-
    c("gallery", "ballerina", "regally", "clergy", "largely", "leading")
  expect_equal(
    anagram(subject, candidates),
    c("gallery", "regally", "largely")
  )
})

test_that("detects multiple anagrams with different case", {
  subject <- "nose"
  candidates <-
    c("Eons", "ONES")
  expect_equal(
    anagram(subject, candidates),
    c("Eons", "ONES")
  )
})

test_that("does not detect identical words", {
  subject <- "corn"
  candidates <- c("corn", "dark", "Corn", "rank", "CORN", "cron", "park")
  expect_equal(
    anagram(subject, candidates),
    c("cron")
  )
})

test_that("does not detect non-anagrams with identical checksum", {
  subject <- "mass"
  candidates <- c("last")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("detects anagrams case-insensitively", {
  subject <- "Orchestra"
  candidates <- c("cashregister", "Carthorse", "radishes")
  expect_equal(
    anagram(subject, candidates),
    c("Carthorse")
  )
})

test_that("detects anagrams using case-insensitive subject", {
  subject <- "Orchestra"
  candidates <- c("cashregister", "carthorse", "radishes")
  expect_equal(
    anagram(subject, candidates),
    c("carthorse")
  )
})

test_that("detects anagrams using case-insensitve possible matches", {
  subject <- "orchestra"
  candidates <- c("cashregister", "Carthorse", "radishes")
  expect_equal(
    anagram(subject, candidates),
    c("Carthorse")
  )
})

test_that("does not detect a anagram if the original word is repeated", {
  subject <- "go"
  candidates <- c("go Go GO")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("anagrams must use all letters exactly once", {
  subject <- "tapper"
  candidates <- c("patter")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("eliminates anagrams with the same checksum", {
  subject <- "mass"
  candidates <- c("last")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that("words are not anagrams of themselves", {
  subject <- "BANANA"
  candidates <- c("BANANA")
  expect_equal(
    anagram(subject, candidates),
    c()
  )
})

test_that(
  "not an anagram even if letter case is partially different",
  {
    subject <- "BANANA"
    candidates <- c("Banana")
    expect_equal(
      anagram(subject, candidates),
      c()
    )
  }
)

test_that(
  "not an anagram even if letter case is completely different",
  {
    subject <- "BANANA"
    candidates <- c("banana")
    expect_equal(
      anagram(subject, candidates),
      c()
    )
  }
)

test_that(
  "words other than themselves can be anagrams",
  {
    subject <- "LISTEN"
    candidates <- c("LISTEN", "Silent")
    expect_equal(
      anagram(subject, candidates),
      c("Silent")
    )
  }
)
