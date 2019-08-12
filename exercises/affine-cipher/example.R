normalise<-function(text){
  return(tolower(gsub(" ", "", text)))
}

lookupindex<-function(normalisedtext){
  letterslist <- strsplit(normalisedtext, "")[[1]]
  return(match(letterslist, letters) - 1)
}

gcd <- function(x, y) {
  r <- x %% y
  return(ifelse(r, gcd(y, r), y))
}

mmi <- function(a, m) {
  a <- a %% m
  for (x in 1:m) {
    if ((a * x) %% m == 1) {
      return(x)
    }
  }
  return(1)
}

encrypt <- function(plaintext, a, b) {
  m <- 26
  
  if (gcd(a, m) != 1) {
    stop(paste('a=',a,' and m=',m,'is coprime'))
  }
  
  normalisedplaintext<-normalise(plaintext) 
  x<-lookupindex(normalisedplaintext)
  
  return(paste(letters[ ((a * x + b) %% m) + 1], collapse = ""))
}

decrypt <- function(encryption, a, b) {
  m <- 26
  
  if (gcd(a, m) != 1) {
    stop("a and 26 must be co-prime")
  }
  
  normalisedencryption<-normalise(encryption)
  y<-lookupindex(normalisedencryption)
  
  return(paste(letters[((mmi(a, m) * (y - b)) %% m) + 1], collapse = ""))
}
