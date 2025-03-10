# function names are a bit wordy to avoid conflicts with those already in R

# is there something we can/should do with infix operators?

# tests for real values are quite repetitive, could this be improved?

create <- function(real, imag) list(real = real, imag = imag)

real <- function(z) z$real

imag <- function(z) z$imag

add <- function(z1, z2) {
  if (is.numeric(z1)) z1 <- create(z1, 0)
  if (is.numeric(z2)) z2 <- create(z2, 0)
  list(real = z1$real + z2$real, imag = z1$imag + z2$imag)
}

subtract <- function(z1, z2) {
  if (is.numeric(z1)) z1 <- create(z1, 0)
  if (is.numeric(z2)) z2 <- create(z2, 0)
  list(real = z1$real - z2$real, imag = z1$imag - z2$imag)
}

multiply <- function(z1, z2) {
  if (is.numeric(z1)) z1 <- create(z1, 0)
  if (is.numeric(z2)) z2 <- create(z2, 0)
  list(
    real = z1$real * z2$real - z1$imag * z2$imag,
    imag = z1$real * z2$imag + z1$imag * z2$real
  )
}

divide <- function(z1, z2) {
  if (is.numeric(z1)) z1 <- create(z1, 0)
  if (is.numeric(z2)) z2 <- create(z2, 0)
  divisor <- z2$real^2 + z2$imag^2
  list(
    real = (z1$real * z2$real + z1$imag * z2$imag) / divisor,
    imag = (z1$imag * z2$real - z1$real * z2$imag) / divisor
  )
}

absolute <- function(z) sqrt(z$real^2 + z$imag^2)

conjugate <- function(z) list(real = z$real, imag = -z$imag)

exponential <- function(z) {
  exp_a <- exp(z$real)
  list(real = exp_a * cos(z$imag), imag = exp_a * sin(z$imag))
}
