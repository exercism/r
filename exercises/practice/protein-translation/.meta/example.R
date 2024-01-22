proteins <- function(bases) {
  if (nchar(bases) == 0) return(NULL)
  
  codons <- strsplit(bases, "(?<=.{3})", perl=TRUE)[[1]]
  
  translation <- list(
    AUG = "Methionine", UUU = "Phenylalanine", UUC = "Phenylalanine", 
    UUA = "Leucine", UUG = "Leucine", UCU = "Serine", UCC = "Serine",  
    UCA = "Serine", UCG = "Serine", UAU = "Tyrosine", UAC = "Tyrosine", 
    UGU = "Cysteine", UGC = "Cysteine", UGG = "Tryptophan", UAA = "STOP", 
    UAG = "STOP", UGA = "STOP")
  
  output <- c()
  
  for (codon in codons) {
    # All valid codons must be 3 characters
    if (nchar(codon) != 3) stop("Invalid codon")
    
    amino_acid <- translation[[codon]]
    
    # Not all 3-letter sequences are valid codons
    if (is.null(amino_acid)) stop("Invalid codon")
    
    # Obey a STOP codon and return what we have so far
    if (amino_acid == "STOP") break
    
    output <- append(output, amino_acid)
  }
  
  output
}
