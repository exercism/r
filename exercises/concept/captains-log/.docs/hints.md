# Hints

## 1. Generate a random planet

- This looks like [sampling][ref-sample] from an input vector.

## 2. Randomize a fleet of starships

- The Introduction discusses shuffling.

## 3. Generate a random starship registry number

- The numeric part is sampling from a range.
- There are several ways to construct the string, including [`sprintf()`][ref-sprintf] and [`str_glue()`][ref-str_glue].

## 4. Generate a random stardate

- We want a floating-point value with [uniform distribution][ref-runif] within lower and upper limits.
- Nuances about inclusive or exclusive limits can be ignored for this task.

[ref-sample]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sample
[ref-sprintf]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sprintf
[ref-runif]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/Uniform
[ref-str_glue]: https://stringr.tidyverse.org/reference/str_glue.html
