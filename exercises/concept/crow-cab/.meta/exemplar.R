simplex <- function(a, b) {
  complex(real = a, imaginary = b)
}

driver_directions <- function(start, end) {
  end - start
}

manhattan <- function(start, end) {
  distance <- driver_directions(start, end)
  abs(Re(distance)) + abs(Im(distance))
}

as_crow_flies <- function(start, end) {
  abs(driver_directions(start, end))
}

crow_directions <- function(start, end) {
  Conj(driver_directions(start, end))
}
