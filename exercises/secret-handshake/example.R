handshake <- function(n) {
  
  # 1 = wink
  # 10 = double blink
  # 100 = close your eyes
  # 1000 = jump
  # 10000 = reverse
  actions <- c("wink", "double blink", "close your eyes", "jump")
  
  bin <- intToBits(n)
  
  events <- c()
  
  for (i in 1:4) {
    if (bin[i] > 0) {
      events <- c(events, actions[i])
    }
  }
  
  if (bin[5] > 0) {
    events <- rev(events)
  }
  
  events
  
}
