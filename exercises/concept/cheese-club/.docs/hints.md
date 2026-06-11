# Hints

## 1. Classify customers

- Using [`every()`][ref-every] with an anonymous function may be convenient.

## 2. Name customers

- Processing two inputs in parallel: think about [`map2()`][ref-map2] as a possible approach.

## 3. Separate out emphatic customers

- Earlier tasks will help you.
- Which customers do you want to [`keep`][ref-keep] in the output list?

## 4. Change ratings to binary

- There are several ways to solve this, but [`if_else()`][ref-if_else] from the `dplyr` library may be simplest. This was discussed in the [Switch Concept][concept-switch].
- Within `purrr`, another possibility is [`map_int()`][ref-map_int].

## 5. Average ratings over time

- It's a cumulative mean, giving you a clue to the name of a useful function.

[ref-every]: https://purrr.tidyverse.org/reference/every.html
[ref-map2]: https://purrr.tidyverse.org/reference/map2.html
[ref-keep]: https://purrr.tidyverse.org/reference/keep.html
[ref-if_else]: https://dplyr.tidyverse.org/reference/if_else.html
[ref-map_int]: https://purrr.tidyverse.org/reference/map.html
[concept-switch]: https://exercism.org/tracks/r/concepts/switch
