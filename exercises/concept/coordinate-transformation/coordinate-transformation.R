scale <- function(point, s) {
  point * s
}

translate <- function(point, ...) {
  point + c(...)
}

transform2d <- function(dx = 0.1, dy = 0.1, s = 1) {
  \(point) scale(translate(point, dx, dy), s)
}

transform3d <- function(dx = 0.1, dy = 0.1, dz = 0.1, s = 1) {
  \(point) scale(translate(point, dx, dy, dz), s)
}
