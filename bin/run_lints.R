library(lintr)

linters <- list(
  a = line_length_linter(80),
  b = camel_case_linter,
  c = assignment_linter,
  d = commas_linter,
  e = absolute_paths_linter,
  f = infix_spaces_linter
)

files <- list.files(path = "exercises", pattern = ".+\\.R$", recursive = TRUE, full.names = TRUE)
lints <- lintr:::flatten_lints(lapply(files, function(file) {
  if (interactive()) {
    message(".", appendLF = FALSE)
  }
  lint(file, linters, parse_settings = FALSE)
}))
if (interactive()) {
  message()
}
lints <- lintr:::reorder_lints(lints)
class(lints) <- "lints"

has_lints <- length(lints) > 0
lint_output <- NULL
if (has_lints) {
  lint_output <- paste(collapse = "\n", capture.output(print(lints)))
}

testthat::expect(!has_lints, paste(sep = "\n", "Not lint free", lint_output))
