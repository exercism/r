# encrypts message
encrypt <- function(message, a, b) {
  m <- 26

  # computes the greatest common divisor of numbers x and y
  gcd <- function(x, y) {
    r <- x %% y
    return(ifelse(r, gcd(y, r), y))
  }

  # must check a and m are coprime
  if (gcd(a, m) != 1) {
    stop("a and 26 must be co-prime")
  }

  parsedmessage <- tolower(gsub(" ", "", message)) # removed whitespace & lower-cased
  splitlist <- strsplit(parsedmessage, "")[[1]] # list of letters
  x <- match(splitlist, letters) - 1 # index of letters

  # E(x) = (ax + b) mod m
  return(paste(letters[ ((a * x + b) %% m) + 1], collapse = ""))
}

# decrypts encryption
decrypt <- function(encryption, a, b) {
  m <- 26

  # computes the greatest common divisor of numbers x and y
  gcd <- function(x, y) {
    r <- x %% y
    return(ifelse(r, gcd(y, r), y))
  }

  # must check a and m are coprime
  if (gcd(a, m) != 1) {
    stop("a and 26 must be co-prime")
  }

  # computes the modulo multiplicative inverse of a^m
  # a^-1 = mmi( a mod m)=mmi(a,m)
  mmi <- function(a, m) {
    a <- a %% m
    for (x in 1:m) {
      if ((a * x) %% m == 1) {
        return(x)
      }
    }
    return(1)
  }

  parsedencryption <- gsub(" ", "", encryption) # removed whitespace
  splitlist <- strsplit(parsedencryption, "")[[1]] # list of letters
  y <- (match(splitlist, letters) - 1) # index of letters

  # D(y) = a^-1(y - b) mod m
  return(paste(letters[((mmi(a, m) * (y - b)) %% m) + 1], collapse = ""))
}
