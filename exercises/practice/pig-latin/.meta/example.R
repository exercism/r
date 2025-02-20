vowel_pattern <- "(^|\\s+)([aeiou]|xr|yt)(\\w+)"
consonant_pattern <- "(^|\\s+)([^aeiou]?qu|[^aeiou]+)([aeiouy]\\w*)"

translate <- function(text) {
  ifelse(grepl(vowel_pattern, text, perl = TRUE),
    gsub(vowel_pattern, "\\1\\2\\3ay", text, perl = TRUE, fixed = FALSE),
    gsub(consonant_pattern, "\\1\\3\\2ay", text, perl = TRUE, fixed = FALSE)
  )
}
