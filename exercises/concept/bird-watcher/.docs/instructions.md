# Instructions

You're an avid bird watcher that keeps track of how many birds have visited your garden in the last seven days.

You have six tasks, all dealing with the numbers of birds that visited your garden.

## 1. Check how many birds visited today

Implement the `today()` function to return how many birds visited your garden today. The bird counts are ordered by day, with the first element being the count of the oldest day, and the last element being today's count.

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
today(birds_per_day)
# => 1
```

## 2. Increment today's count

Implement the `increment_todays_count()` function to increment today's count:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
increment_todays_count(birds_per_day)
# => c(2, 5, 0, 7, 4, 2)
```

## 3. Check if there was a day with no visiting birds

Implement the `has_day_without_birds()` function that returns `TRUE` if there was a day at which zero birds visited the garden; otherwise, return `FALSE`:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
has_day_without_birds(birds_per_day)
# => true
```

## 4. Calculate the number of visiting birds for the first number of days

Implement the `count_for_first_days()` function that returns the number of birds that have visited your garden from the start of the week, but limit the count to the specified number of days from the start of the week.

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
count_for_first_days(birds_per_day, 4)
# => 14
```

## 5. Calculate the number of busy days

Some days are busier that others. A busy day is one where five or more birds have visited your garden.
Implement the `busy_days()` function to return the number of busy days:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
busy_days(birds_per_day)
# => 2
```