scale <- function(point, s) {
  point * s
}

translate <- function(point, ...) {
  point + c(...)
}

transform2d <- function(dx, dy, s = 1) {
  \(point) scale(translate(point, dx, dy), s)
}

transform3d <- function(dx, dy, dz, s = 1) {
  \(point) scale(translate(point, dx, dy, dz), s)
}
