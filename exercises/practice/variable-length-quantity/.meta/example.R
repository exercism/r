# octicosahectimal?

encode <- \(nn) {
  nn |>
    lapply(\(n) {
      bytes <- n %% 128
      while (n >= 128) {
        n <- n %/% 128
        bytes <- c(n %% 128 + 128, bytes)
      }
      bytes
    }) |>
    (\(seqs) do.call(c, seqs))()
}

decode <- \(allbytes) {
  n <- length(allbytes)
  ends <- which(allbytes < 128)
  if (tail(ends, 1) != n) stop()
  starts <- c(1, head(ends, -1) + 1)
  1:length(ends) |>
    sapply(\(i) {
      bytes <- allbytes[starts[i]:ends[i]]
      b128 <- bytes %% 128
      val <- 0
      for (d in b128) {
        val <- 128 * val + d
      }
      val
    })
}
