to_rna <- function(dna) {
  
  dna_to_rna <- list(G = "C", C = "G", T = "A", A = "U")
  
  func <- function(x) {
    if (!(x %in% c("G", "C", "T", "A"))) {
      stop("invalid dna strand")
    }
    dna_to_rna[[x]]
  }
  
  paste(lapply(strsplit(dna, "")[[1]], FUN = func), collapse = "")
  
}
