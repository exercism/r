#!/usr/bin/Rscript

library(jsonlite)
library(testthat)

config <- jsonlite::fromJSON("config.json")

temp_dir <- "temp" 

dir.create(temp_dir)
setwd(temp_dir)

for (exercise in config$exercises$slug) {
  
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

setwd(dir = "../")
unlink("temp", recursive = TRUE)
