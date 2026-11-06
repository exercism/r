# Hints

## 1. Calculate the value of any given card

- An old-style [`switch`][ref-switch] works well here, as it only needs to handle a single card on each call.
- Using [`recode_values`][ref-recode_values] is another option, but quotes around strings cannot be omitted in this case.

## 2. Implement the decision logic for the first turn

- [`case_when`][ref-case_when] is helpful in this task.
- The task can be solved in base R using a series of conditionals, but less elegantly.

[ref-switch]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/switch.html
[ref-recode_values]: https://dplyr.tidyverse.org/reference/recode-and-replace-values.html
[ref-case_when]: https://dplyr.tidyverse.org/reference/case_when.html
