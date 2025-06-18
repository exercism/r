small_n <- c(
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen')

tens <- c(
  'ten',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety')

oom <- c('billion', 'million', 'thousand', '')

say_group <- \(n) {
  h <- n %/% 100
  if (h == 0) sh <- c()
  else sh <- c(small_n[h], 'hundred')
  r <- n %% 100
  if (r < 20) sh <- c(sh, small_n[r])
  else sh <- c(sh, tens[r %/% 10])
  last <- r %% 10
  if (last > 0 && r >= 20) sh <- c(sh, '-', small_n[last])
  sh
}

group <- \(number) {
  groups <- rep(0, 4)
  for (i in 4:1) {
    groups[i] <- number %% 1000
    number <- number %/% 1000
  }
  groups
}

say <- \(number) {
  if (number < 0 || number >= 1e12) stop('input out of range')
  if (number == 0) return('zero')
  groups <- group(number)
  sh <- c()
  for (i in 1:3) {
    if (groups[i] > 0) {
      sh <- c(sh, say_group(groups[i]), oom[i])
    }
  }
  sh <- c(sh, say_group(groups[4]))
  gsub(' - ', '-', paste(sh, collapse = ' '))
}
