sum_of_multiples <- function(factors, limit) {
  
  get_mults <- function(factor) {
    
    max_mult <- ceiling(limit / factor) - 1
    if (max_mult > 0) {
      new_multiples <- factor * 1:max_mult
    }
    
  }
  
  multiples <- unique(unlist(lapply(factors, FUN = get_mults)))
  
  return(sum(as.numeric(multiples)))
  
}
