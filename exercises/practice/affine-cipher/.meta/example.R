library(stringr)
library(purrr)

gcd <- function(x, y) {
  r <- x %% y
  ifelse(r, gcd(y, r), y)
}

mmi <- function(a, m) {
  a <- a %% m
  for (x in 1:m) {
    if ((a * x) %% m == 1) return(x)
  }
  1
}

translate <- function(phrase, a, b, mode) {
  m <- 26
  stopifnot(gcd(a, m) == 1)
  stopifnot(mode %in% c(0, 1))

  process_char <- function(c) {
    if (c %in% "0":"9") return(c)

    inx_c <- utf8ToInt(c) - utf8ToInt("a")
    new_c <- ifelse(mode == 0, a * inx_c + b, mmi(a, m) * (inx_c - b))
    intToUtf8(new_c %% m + utf8ToInt("a"))
  }

  phrase |>
    str_to_lower() |>
    str_replace_all("[^a-z0-9]", "") |>
    str_split_1("") |>
    map_chr(process_char) |>
    str_flatten()
}

encode <- function(plaintext, a, b) {
  plaintext |>
    translate(a, b, mode = 0) |>
    str_match_all(".{1,5}") |>
    unlist() |>
    str_c(collapse = " ")
}

decode <- function(ciphertext, a, b) {
  ciphertext |>
    translate(a, b, mode = 1)
}
