library(jsonlite)
library(testthat)

test_exercise <- function(exercise) {
  
  solution_file <- paste0(exercise, ".R")
  test_file <- paste0("test_", exercise, ".R")
  
  file.copy(
    file.path("..", "exercises", exercise, "example.R"), 
    solution_file
  )
  file.copy(
    file.path("..", "exercises", exercise, test_file), 
    test_file
  )
  
  source(test_file)
  rm(list = ls())
  
}

# create temp directory for testing purposes
temp_dir <- "temp" 
dir.create(temp_dir)
setwd(temp_dir)

# read config and test all exercises
config <- fromJSON(file.path("..", "config.json"))
lapply(config$exercises$slug, test_exercise)

# clean up
setwd(dir = "../")
unlink("temp", recursive = TRUE)
