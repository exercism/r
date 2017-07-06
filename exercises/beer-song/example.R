library(magrittr)

lyrics <- function(first, last) {
  
}

verse <- function(number) {
  
  clean_verse <- function(v)
    unlist(gsub("\\ +", " ", v))
  
  # sequence of verses with same text
  b <- "bottle"
  ob <- "of beer"
  otw <- "on the wall"
  todapia <- "Take one down and pass it around"
  
  # different text for last two verses
  om <- "o more"
  tidapia <- "Take it down and pass it around"
  gttsabsm <- "Go to the store and buy some more"
  
  # abbreviate variable
  n <- number
  
  if (n == 2) {
    sprintf("2 %ss %s %s, 2 %ss %s.\n%s, 1 %s %s %s.\n",
            b, ob, otw, b, ob, todapia, b, ob, otw) %>% 
      clean_verse
  } else if (n == 1) {
    sprintf("1 %s %s %s, 1 %s %s.\n%s, n%s %ss %s %s.\n",
            b, ob, otw, b, ob,     tidapia, om, b, ob, otw) %>% 
      clean_verse
  } else if (n == 0) {
    sprintf("N%s %ss %s  %s,  n%s %ss %s.\n%s, 99    %ss %s  %s.\n",
            om, b,  ob, otw, om, b,  ob,  gttsabsm, b,  ob, otw) %>% 
      clean_verse
  } else {
    sprintf("%d %ss %s %s, %d %ss %s.%s%s, %d %ss %s %s.\n",
            n, b, ob, otw, n, b, ob, "\n", todapia, n-1, b, ob, otw) %>% 
      clean_verse
  }
}
