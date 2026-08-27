source("./ozans-playlist.R")
library(testthat)

# 1) remove_duplicates

test_that("1. works for a non-empty playlist", {
  track_1 <- "Two Paintings and a Drum - Carl Cox"
  track_2 <- "Leash Called Love - The Sugarcubes"
  playlist <- c(track_1, track_2, track_1)
  expected <- c(track_1, track_2)
  expect_equal(remove_duplicates(playlist), expected)
})

test_that("1. works for an empty playlist", {
  playlist <- c()
  expected <- c()
  expect_equal(remove_duplicates(playlist), expected)
})

# 2) has_track

test_that("2. returns true when the track is in the playlist", {
  track_1 <- "Big Science - Laurie Anderson"
  track_2 <- "Tightrope - Laurie Anderson"
  playlist <- c(track_1, track_2)
  expect_equal(has_track(playlist, track_1), TRUE)
})

test_that("2. returns false when the track is not in the playlist", {
  track_1 <- "Big Science - Laurie Anderson"
  track_2 <- "Tightrope - Laurie Anderson"
  playlist <- c(track_2)
  expect_equal(has_track(playlist, track_1), FALSE)
})

# 3) add_tracks

test_that("3. adds tracks that are not already in the playlist", {
  track_1 <- "Jigsaw Feeling - Siouxsie and the Banshees"
  track_2 <- "Feeling Good - Nina Simone"
  playlist <- c()
  expected <- c(track_1)
  expect_equal(add_tracks(playlist, track_1), expected)
})

test_that("3. does not add a track that is already in the playlist", {
  track_1 <- "Jigsaw Feeling - Siouxsie and the Banshees"
  track_2 <- "Feeling Good - Nina Simone"
  playlist <- c(track_1, track_2)
  expected <- c(track_1, track_2)
  expect_equal(add_tracks(playlist, track_1), expected)
})

test_that("3. add multiple tracks, some already in the playlist", {
  track_1 <- "Jigsaw Feeling - Siouxsie and the Banshees"
  track_2 <- "Feeling Good - Nina Simone"
  track_3 <- "I Was an Eagle - Laura Marling"
  playlist <- c(track_1, track_2)
  expected <- c(track_1, track_2, track_3)
  expect_equal(add_tracks(playlist, c(track_1, track_3)), expected)
})

# 4) delete_tracks

test_that("4. works if the track is present in the playlist", {
  track_1 <- "Ancestors - Tanya Tagaq"
  track_2 <- "Take This Hammer - Lead Belly"
  playlist <- c(track_1, track_2)
  expected <- c(track_2)
  expect_equal(delete_tracks(playlist, track_1), expected)
})

test_that("4. works if the track is not present in the playlist", {
  track_1 <- "Ancestors - Tanya Tagaq"
  track_2 <- "Take This Hammer - Lead Belly"
  playlist <- c(track_2)
  expected <- c(track_2)
  expect_equal(delete_tracks(playlist, track_1), expected)
})

test_that("4. works for multiple tracks if some present in the playlist", {
  track_1 <- "Ancestors - Tanya Tagaq"
  track_2 <- "Take This Hammer - Lead Belly"
  track_3 <- "With Or Without You - U2"
  playlist <- c(track_1, track_2)
  expected <- c(track_2)
  expect_equal(delete_tracks(playlist, c(track_1, track_3)), expected)
})

# 5) find_common_tracks

test_that("5. works when there is partial overlap", {
  track_1 <- "Ancestors - Tanya Tagaq"
  track_2 <- "Take This Hammer - Lead Belly"
  track_3 <- "With Or Without You - U2"
  playlist_1 <- c(track_1, track_2)
  playlist_2 <- c(track_2, track_3)
  expected <- c(track_2)
  expect_equal(find_common_tracks(playlist_1, playlist_2), expected)
})

test_that("5. works when there nothing in common", {
  track_1 <- "Paranoid - Black Sabbath"
  track_2 <- "Overkill - Motörhead"
  track_3 <- "Gurre-Lieder - Schönberg"
  track_4 <- "Gymnopédies - Satie"
  playlist_1 <- c(track_1, track_2)
  playlist_2 <- c(track_3, track_4)
  expect_equal(length(find_common_tracks(playlist_1, playlist_2)), 0)
})
