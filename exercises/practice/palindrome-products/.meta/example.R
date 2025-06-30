verso <- \(n) {
  v <- 0
  while (n > 0) {
    v <- 10 * v + n %% 10
    n <- n %/% 10
  }
  v
}

nlen <- \(n) ceiling(log10(n + 1))

haflen <- \(n) (log10(n) + 1) %/% 2

nconc <- \(m, n) m * 10 ^ nlen(n) + n

succ <- \(n) {
  if (n == 0) return(1) # kludge
  nl <- nlen(n)
  if (nl != nlen(n + 1)) return(n + 2)
  hl <- haflen(n)
  left <- n %/% 10 ^ (nl - hl)
  leftmid <- n %/% 10 ^ hl
  right <- n %% 10 ^ hl
  v <- verso(left)
  if (v > right) return(nconc(leftmid, v))
  newleftmid <- leftmid + 1
  newright <- verso(newleftmid %/% 10 ^ (nl - 2 * hl))
  newleftmid * 10 ^ hl + newright
}

pred <- \(n) {
  nl <- nlen(n)
  if (n - 1 == 10 ^ (nl - 1)) return(n - 2)
  hl <- haflen(n)
  left <- n %/% 10 ^ (nl - hl)
  leftmid <- n %/% 10 ^ hl
  right <- n %% 10 ^ hl
  v <- verso(left)
  if (v < right) return(nconc(leftmid, v))
  newleftmid <- leftmid - 1
  newright <- verso(newleftmid %/% 10 ^ (nl - 2 * hl))
  newleftmid * 10 ^ hl + newright
}

listify <- \(x) lapply(1:nrow(x), \(i) as.integer(x[i, ]))

palindrome_products <- \(input) {
  if (input$min > input$max) stop()
  result <- list()
  lb <- input$min ^ 2 - 1
  ub <- input$max ^ 2 + 1
  cand <- lb
  while (cand < ub) {
    cand <- succ(cand)
    i <- input$min:floor(sqrt(cand))
    r <- cand %% i
    w <- which(r == 0)
    if (length(w) == 0) next
    i <- i[w]
    j <- cand %/% i
    w <- which(j %in% input$min:input$max)
    if (length(w) == 0) next
    result$smallest <- list(value = cand, factors = listify(cbind(i[w], j[w])))
    break
  }
  cand <- ub
  while (cand > lb) {
    cand <- pred(cand)
    i <- input$min:floor(sqrt(cand))
    r <- cand %% i
    w <- which(r == 0)
    if (length(w) == 0) next
    i <- i[w]
    j <- cand %/% i
    w <- which(j %in% input$min:input$max)
    if (length(w) == 0) next
    result$largest <- list(value = cand, factors = listify(cbind(i[w], j[w])))
    break
  }
  result
}

