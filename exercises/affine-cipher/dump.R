
encrypt()
# removed whitespace & lower-cased
parsedplaintext <- tolower(gsub(" ", "", plaintext))
# list of letters
splitlist <- strsplit(parsedplaintext, "")[[1]]
# index of letters
x <- match(splitlist, letters) - 1

decrypt()
# removed whitespace
parsedencryption <- gsub(" ", "", encryption)


encrypt <- function(plaintext, a, b) {
  
}


decrypt <- function(encryption, a, b) {
  
}

