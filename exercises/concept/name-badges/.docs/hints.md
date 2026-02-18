# Hints

## 1. Print a badge for an employee

- To construct the strings in Base R, the [`sprintf`][ref-sprintf] function is useful.
- For a Tidyverse approach, you can use [`str_glue`][ref-str_glue] from the `stringr` library.

## 2. Print a badge for a new employee

- Branch on [`is.na`][ref-isna].

## 3. Print a badge for the owner

- Branch on [`is.null`][ref-isnull].

## 4. Calculate the total salary of employees with no ID

- You can [filter][concept-vector-filtering] on [`is.na`][ref-isna] then [`sum`][ref-sum].
- What is `salaries[is.na(ids)]` if there are no employees without ID? It would be useful to check this in an R console. If R is not installed on you computer, online consoles such as [rdrr.io][web-rdrr] may help.

[ref-sprintf]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sprintf
[ref-str_glue]: https://stringr.tidyverse.org/reference/str_glue.html
[ref-isna]: https://www.rdocumentation.org/packages/base/versions/3.3.2/topics/NA
[ref-isnull]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/NULL
[ref-sum]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sum
[concept-vector-filtering]: https://exercism.org/tracks/r/concepts/vector-filtering
[web-rdrr]: https://rdrr.io/snippets/
