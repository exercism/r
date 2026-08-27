# Hints

## 1. Check Valid Command

- You will probably need [`ignore_case`][ref-regex] in the regex definition.
- Search just the start of the message.

## 2. Remove Encrypted Emojis

- `stringr` has both [`str_replace()`][ref-str_replace] and [`str_remove()`][ref-str_remove] functions.

## 3. Check Valid Phone Number

- Branch depending on whether or not the regex is [detected][ref-str_detect].
- Review the [Strings Concept][concept-strings] if you have trouble assembling the output.

## 4. Greet the User

- You will need multiple capture groups.
- [`str_replace()`][ref-str_replace] works best with _unnamed_ captures: keep it simple.

## 5. Get Website Link

- There can be multiple matches in each message.
- Read the Introduction for advice (near the bottom) on using `str_match_all()` and unpacking the results: _a bit confusing, but not really difficult_.

[concept-strings]: https://exercism.org/tracks/R/concepts/strings
[ref-regex]: https://stringr.tidyverse.org/reference/modifiers.html
[ref-str_detect]: https://stringr.tidyverse.org/reference/str_detect.html
[ref-str_replace]: https://stringr.tidyverse.org/reference/str_replace.html
[ref-str_remove]: https://stringr.tidyverse.org/reference/str_remove.html
