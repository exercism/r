allergy <- function(num) {
  
  allergy_list <- list(
    cats = 128,
    pollen = 64,
    chocolate = 32,
    tomatoes = 16,
    strawberries = 8,
    shellfish = 4,
    peanuts = 2,
    eggs = 1
  )
  
  check_allergy <- function(allergy, val) {
    val %% (allergy * 2) >= allergy
  }
  
  allergies <- lapply(allergy_list, check_allergy, num)
  
  structure(allergies, class = 'allergy')
  
}

allergic_to <- function(allergy_object, allergy) {
  allergy_object[[allergy]]
}

list_allergies <- function(allergy_object) {
  names(which(allergy_object == TRUE))
}
