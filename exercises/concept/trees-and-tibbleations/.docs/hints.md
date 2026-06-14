# Hints

## 1. Rename a column

- Remember, you need to modify the `trees` dataset, which is available if `library(datasets)` is called.
- You may (or may not) want to convert the initial `data.frame` into a `tibble`.
- See the Introduction for how to change a column name.

## 2. Add girth and weight columns

- See the Introduction for how to add columns.
- The new columns can be calculated with existing columns.
- Don't forget to round to the required precision.

## 3. Orchard copy of dataset

- You need to move columns around and sort rows (see the Introduction).

## 4. Customer copy of dataset

- You will need to take a subset of columns.
- Only the trees between the minimum and maximum height *and* below the maximum weight should be in the copy.

[ref-allof]: https://tidyselect.r-lib.org/reference/all_of.html
[ref-pick]: https://dplyr.tidyverse.org/reference/pick.html
[ref-datamask]: https://rlang.r-lib.org/reference/args_data_masking.html
