print_name_badge <- function(id, name, department) {
  dept <- ifelse(is.null(department), "OWNER", toupper(department))
  if (is.na(id)) {
    return(sprintf("%s - %s", name, dept))
  }
  sprintf("[%d] - %s - %s", id, name, dept)
}

salaries_no_id <- function(ids, salaries) {
  sum(salaries[is.na(ids)])
}

# The above code uses only Base R

# A version using Tidyverse functions is shownbelow.

# library(dplyr)
# library(stringr)

# print_name_badge <- function(id, name, department) {
#   dept <- if_else(is.null(department), "OWNER", toupper(department)[1])
#   if (is.na(id)) {
#     return(str_glue("{name} - {dept}"))
#   }
#   str_glue("[{id}] - {name} - {dept}")
# }
