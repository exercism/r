check_humidity_level <- function(pct_humidity) {
  stopifnot(pct_humidity <= 70)
  message("humidity test passed")
  TRUE
}

report_overheating <- function(temperature) {
  if (is.null(temperature)) stop("Sensor Broken")
  if (temperature > 600) stop(sprintf("Overheating: %d C", temperature))
  if (temperature > 500) {
    warning(sprintf("Risk of overheating: %d C", temperature))
    return(FALSE)
  }
  message(sprintf("temperature check passed: %d °C", temperature))
  TRUE
}

monitor_the_machine <- function(pct_humidity, temperature) {
  if (check_humidity_level(pct_humidity) && report_overheating(temperature)) {
    message("All OK!")
  }
}
