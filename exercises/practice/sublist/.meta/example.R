compare <- function(vec_one, vec_two) {
  switch(sign(length(vec_one) - length(vec_two)) + 2,
    ifelse(is_subvector(vec_one, vec_two), "subvector", "unequal"),
    ifelse(identical(vec_one, vec_two), "equal", "unequal"),
    ifelse(is_subvector(vec_two, vec_one), "supervector", "unequal")
  )
}

is_subvector <- function(vec_one, vec_two) {
  for (i in seq_len(length(vec_two) - length(vec_one) + 1)) {
    if (all(vec_one == vec_two[i:(i + length(vec_one) - 1)])) {
      return(TRUE)
    }
  }

  FALSE
}
