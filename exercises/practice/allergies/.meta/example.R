library(magrittr)

allergy <- function(num) {
  
  allergy_list <- c(
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
  )
  
  check_allergy <- function(allergy, val) {
    intToBits(val)[which(allergy_list == allergy)] %>% as.logical()
  }
  
  allergies <- sapply(allergy_list, check_allergy, num)
  
  structure(allergy_list[allergies], class = "allergy")
  
}

allergic_to <- function(allergy_object, allergy) {
  allergy %in% allergy_object
}

list_allergies <- function(allergy_object) {
  as.vector(allergy_object)
}
