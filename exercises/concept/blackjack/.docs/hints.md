# Hints

## 1. Calculate the value of any given card

- An old-style [`switch`][ref-switch] works well here, as it only needs to handle a single card on each call.
- Using [`case_match`][ref-case_match] is another option, but quotes around strings cannot be omitted in this case.

## 2. Implement the decision logic for the first turn

- [`case_when`][ref-case_when] is helpful in this task.
- The task can be solved in base R using a series of conditionals, but less elegantly.

[ref-switch]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/switch.html
[ref-case_match]: https://dplyr.tidyverse.org/reference/case_match.html
[ref-case_when]: https://dplyr.tidyverse.org/reference/case_when.html
