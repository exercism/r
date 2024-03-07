new_robot <- function(coordinates = numeric(2), direction = c("NORTH", "EAST", "SOUTH", "WEST")) {
  stopifnot(is.numeric(coordinates))
  stopifnot(length(coordinates) == 2)
  direction <- match.arg(direction)
  
  structure(
    list(
      coordinates = as.integer(coordinates),
      direction = direction
    ),
    class = "robot"
  )
}

move <- function(some_robot, commands) {
  UseMethod("move")
}

move.robot <- function(some_robot, commands) {
  DIRECTIONS <- c("NORTH", "EAST", "SOUTH", "WEST")
   x <- c(0, 1, 0, -1)
   names(x) <- DIRECTIONS
   y <- c(1, 0, -1, 0)
   names(y) <- DIRECTIONS
   for (command in strsplit(commands, "")[[1]]) {
     if (command == "R") {
       some_robot$direction <- DIRECTIONS[which(DIRECTIONS == some_robot$direction) %% 4 + 1]
     }
     else if (command == "L") {
       ind <- which(DIRECTIONS == some_robot$direction) - 1
       if (ind == 0) ind <- 4
       some_robot$direction <- DIRECTIONS[ind]
     }
     else if (command == "A") {
       some_robot$coordinates <- 
         some_robot$coordinates + c(x[some_robot$direction], y[some_robot$direction]) |>
         unname()
     }
   }
   some_robot
}

