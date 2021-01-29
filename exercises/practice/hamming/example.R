hamming <- function(strand1, strand2) {
  if (nchar(strand1) != nchar(strand2)) {
    stop("undefined hamming distance")
  }
  strand1 <- strsplit(strand1, "")[[1]]
  strand2 <- strsplit(strand2, "")[[1]]
  sum(strand1 != strand2)
}
