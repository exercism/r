tournament <- function(input) {

  results <- data.frame(Team = "tempTeam", MP = 0, W = 0, D = 0, L = 0, P = 0)
  
  for (item in input) {
    
    match <- unlist(strsplit(item, ";"))
    # Check that match result is valid
    if (length(match) != 3 || !(match[3] %in% c("draw", "win", "loss"))) {
      next
    }
    else {
      # Process result
      if (match[3] == "draw") {
        results <- rbind(results, 
                         c(match[1], 1, 0, 1, 0, 1), 
                         c(match[2], 1, 0, 1, 0, 1))
      } else if (match[3] == "win") {
        results <- rbind(results, 
                         c(match[1], 1, 1, 0, 0, 3), 
                         c(match[2], 1, 0, 0, 1, 0))
      } else {
        results <- rbind(results, 
                         c(match[2], 1, 1, 0, 0, 3), 
                         c(match[1], 1, 0, 0, 1, 0))
      }
    }
    
  }
  
  results[, 2:6] <- sapply(results[, 2:6], as.numeric)
  
  output <- aggregate(.~Team, results[-1, ], sum)
  output <- output[order(-output$P, output$Team), ]
  row.names(output) <- 1:nrow(output)
  output
  
}
