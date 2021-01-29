scrabble_score <- function(input){
  
  # Letter                           Value
  # A, E, I, O, U, L, N, R, S, T       1
  # D, G                               2
  # B, C, M, P                         3
  # F, H, V, W, Y                      4
  # K                                  5
  # J, X                               8
  # Q, Z                               10
  
  letter_score <- c(1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 
                    1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10)
  names(letter_score) <- LETTERS
  
  chars <- unlist(strsplit(input, ""))
  
  sum(letter_score[toupper(chars)])
  
}
