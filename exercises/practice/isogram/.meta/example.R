is_isogram <- function(word) {

  func <- function(x) {
    sum(x == unlist(strsplit(tolower(word), "")))
  }

  all(lapply(letters, FUN = func) <= 1)

}
