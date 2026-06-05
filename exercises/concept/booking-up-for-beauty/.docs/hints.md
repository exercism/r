# Hints

## 1. Parse all-number appointment date

- Lubridate has many [helper functions][ref-parse] for datetime parsing.

## 2. Check if an appointment has already passed

- When [getting the current time][ref-now], remember to use `UTC` and not your local timezone.

## 3. Check if appointment is in the afternoon

- You only need the `hour` part of the datetime.

## 4. Check the day of the week for an appointment

- Check the Introduction: Monday is not the _default_ day 1 in lubridate.

## 5. Reschedule an appointment

- The input is in the same format as Task 1.
- What day is the original appointment for?
  Task 4 can help with this.
- How many days do you need to add to get to a Friday (not today, if the input is a Friday appointment).?
- **Warning**: the old `ifelse()` function from Base R does not play nicely with datetimes.
  If you need this sort of logic, the [`if_else()`][ref-if_else] from the dplyr library is a more reliable alternative (as described in the [`Switch`][concept-switch] Concept).

[ref-parse]: https://lubridate.tidyverse.org/reference/ymd_hms.html
[ref-now]: https://www.rdocumentation.org/packages/lubridate/versions/1.7.4/topics/now
[ref-if_else]: https://dplyr.tidyverse.org/reference/if_else.html
[concept-switch]: https://exercism.org/tracks/r/concepts/switch
