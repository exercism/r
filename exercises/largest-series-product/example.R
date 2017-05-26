largest_series_product <- function(digits, span){

  nums <- as.numeric(unlist(strsplit(digits, "")))

  if (any(is.na(nums)) || span < 0 || span > length(nums)) {
    stop("Non-numeric characters or span less than digit length")
  }

  if (span == 0) {
    return(1)
  }

  indices <- 1:(length(nums) - span + 1)

  get_prod <- function(index, nums, span) {
    prod(nums[index:(index + span - 1)])
  }

  products <- sapply(indices, FUN = get_prod, nums, span)

  max(products)
}
