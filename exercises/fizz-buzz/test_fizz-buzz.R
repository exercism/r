source("./fizz-buzz.R")
library(testthat)

solMethod <- function(input) {
  condition<-function(i){
    if(i%%3==0 && i%%5==0){
      return("Fizz Buzz")
    }else if(i%%3==0){
      return("Fizz")
    }else if(i%%5==0){
      return("Buzz")
    }else{
      return(i)
    }
  }
  return (sapply(seq(1,input),condition))
}

test_that("Test length of returned vector", {
  expect_length(fizz_buzz(10),10)
})

test_that("Vector of strings match",{
  expect_identical(fizz_buzz(10), solMethod(10))
  expect_identical(fizz_buzz(100), solMethod(100))
  expect_identical(fizz_buzz(10000), solMethod(10000))
})



message("All tests passed for exercise: fizz-buzz")






