new_car <- function(speed, battery_drain) {
  list(
    speed = speed, 
    battery_drain = battery_drain,
    battery = 100, 
    distance_traveled = 0
  )
}

new_track <- function(track_length) {
  list(track_length = track_length)
}

battery_drained <- function(car) {
  car$battery < car$battery_drain
}

drive <- function(car) {
  if (battery_drained(car)) return(car)
  
  car$battery <- car$battery - car$battery_drain
  car$distance_traveled <- car$distance_traveled + car$speed
  car
}

can_finish <- function(car, track) {
  max_distance <- floor(car$battery / car$battery_drain) * car$speed
  max_distance >= track$track_length
}

store_track <- function(car, track, name) {
  car$battery <- 100
  car$distance_traveled <- 0
  car[[name]] <- list(track_length = track$track_length, complete = can_finish(car, track))
  car
}
