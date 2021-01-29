library(magrittr)

nucleotide_count <- function(input) {
  
  strand_chr <- strsplit(input, "")[[1]]
  
  nucleotides <- c("A", "C", "G", "T")
  
  if (length(strand_chr) > 0 && !all(strand_chr %in% nucleotides)) {
    stop("Invalid nucleotide in strand")
  }
  
  nucleotides %>% 
    sapply(function(x) {sum(x == strand_chr)}) %>% 
    as.list()
  
}
