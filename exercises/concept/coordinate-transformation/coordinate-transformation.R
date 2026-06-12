move <- function(x, y, dx = 0.1, dy = 0.1) {
  c(x + dx, y + dy)
}

translate2d <- function(dx, dy) {
  \(x, y) c(x + dx, y + dy)
}

translate_point <- function(delta) {
  \(point) point + delta
}

scale2d <- function(scaling) {
  \(point) c(point * scaling)
}


g <- translate_point(c(.5, .6))
class(g)
