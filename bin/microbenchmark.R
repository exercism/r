# assist the "optimize for speed" instruction
if ("microbenchmark" %in% rownames(installed.packages())) {
  microbenchmark:::print.microbenchmark(signif = 1,
    microbenchmark::microbenchmark(total(), times = 7))
}
