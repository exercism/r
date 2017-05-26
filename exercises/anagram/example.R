anagram <- function(subject, candidates) {
  # subject is a string
  # candidates is a character vector
  # break subject into vector of characters
  subject <- tolower(subject)
  test_candidates <- tolower(candidates)
  l <- strsplit(subject, "")[[1]]
  # sub out each character from l in candidates
  for (i in l) {
    test_candidates <- sub(i, "", test_candidates)
  }
  result <- candidates[test_candidates == "" &
                         tolower(candidates) != subject &
                         nchar(candidates) == length(l)]
  if (length(result) == 0) {
    return(c())
  }
  return(result)
}
