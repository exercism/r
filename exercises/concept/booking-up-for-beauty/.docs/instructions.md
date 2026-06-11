# Instructions

In this exercise you'll be working on an appointment scheduler for a beauty salon in New York that opened on September 15th in 2012.

You have five tasks, which will all involve appointment dates.
Times are in 24-hour clock format (no AM/PM).
To keep timezone issues as simple as possible, assume that everything uses UTC.

## 1. Parse all-number appointment date

Implement the `schedule_appointment()` function to parse a textual representation of an appointment date into the corresponding `DateTime` format.

Note that the input is in U.S.-style month/day/year order.

```julia-repl
julia> schedule_appointment("07/25/2023 13:45:00")
2023-07-25T13:45:00
```

## 2. Check if an appointment has already passed

Implement the `has_passed()` function that takes an appointment date and checks if the appointment was somewhere in the past:

```julia-repl
julia> has_passed(DateTime(1999, 12, 31, 9, 0, 0))
true
```

## 3. Check if appointment is in the afternoon

Implement the `is_afternoon_appointment()` function that takes an appointment date and checks if the appointment is in the afternoon (>= 12:00 and < 18:00):

```julia-repl
julia> is_afternoon_appointment(DateTime(2023, 3, 29, 15, 0, 0))
true
```

## 4. Check the day of the week for an appointment

Implement the `day_of_week()` function that returns the _numerical_ day of the week.
The salon is closed on Sundays, so Monday is day 1 and Saturday is day 6.

```R
# a Friday
day_of_week(make_datetime(2026, 06, 05, 12, 30, 00))
#> [1] 5
```

## 5. Reschedule an appointment

When a customer needs to reschedule an appointment, this is automatically made for the next Friday at the same time of day (as this is the slowest day of the week).

Implement the `reschedule()` function that takes the original appointment (as a text string in month/day/year order) and returns a rescheduled appointment.

```R
# a Saturday
reschedule("06/13/2026 12:30:00")
#> [1] "2026-06-19 12:30:00 UTC"
```

If the original appointment was for Monday to Thursday, reschedule to Friday of _this_ week.
For Friday or Saturday appointments, reschedule to Friday of _next_ week.
