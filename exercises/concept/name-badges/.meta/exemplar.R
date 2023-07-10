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
