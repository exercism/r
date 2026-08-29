library(stringr)

normalise <- function(text) {
  tolower(gsub(" ", "", text))
}

lookupindex <- function(normalisedtext) {
  letterslist <- strsplit(normalisedtext, "")[[1]]
  match(letterslist, letters) - 1
}

gcd <- function(x, y) {
  r <- x %% y
  ifelse(r, gcd(y, r), y)
}

mmi <- function(a, m) {
  a <- a %% m
  for (x in 1:m) {
    if ((a * x) %% m == 1) {
      return(x)
    }
  }
  1
}

translate <- function(phrase, a, b, mode) {
  
}

encode <- function(plaintext, a, b) {
  m <- 26

  if (gcd(a, m) != 1) {
    stop("a and m must be co-prime")
  }

  x <- plaintext |> normalise() |> lookupindex()

  text <- paste(letters[ ((a * x + b) %% m) + 1], collapse = "")
  str_match_all(text, ".{1,5}")[[1]] |> str_c(collapse = " ")
}

decode <- function(ciphertext, a, b) {
  m <- 26

  if (gcd(a, m) != 1) {
    stop("a and m must be co-prime")
  }

  y <- ciphertext |> normalise() |> lookupindex()

  paste(letters[((mmi(a, m) * (y - b)) %% m) + 1], collapse = "")
}
