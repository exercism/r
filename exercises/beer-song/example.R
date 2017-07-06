verse <- function(number) {
  # construct different verses
  if (number == 2) {
    paste(sep = "\n",
      "2 bottles of beer on the wall, 2 bottles of beer.",
      "Take one down and pass it around, 1 bottle of beer on the wall.\n")
  } else if (number == 1) {
    paste(sep = "\n",
      "1 bottle of beer on the wall, 1 bottle of beer.",
      "Take it down and pass it around, no more bottles of beer on the wall.\n")
  } else if (number == 0) {
    paste(sep = "\n",
      "No more bottles of beer on the wall, no more bottles of beer.",
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
  } else {
    sprintf(paste(sep = "\n",
        "%d bottles of beer on the wall, %d bottles of beer.",
        "Take one down and pass it around, %d bottles of beer on the wall.\n"),
      number, number, number - 1)
  }
}

lyrics <- function(first, last) {
  # compile song from dynamic number of verses
  song <- c()
  for (i in seq(first, last)) {
    song <- c(song, verse(i))
  }
  
  paste(song, collapse = "\n")
}

