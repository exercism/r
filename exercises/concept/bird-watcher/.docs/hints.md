# Hints

## 1. Check how many birds visited today

- "Today" means the last entry in the `birds_per_day` vector.
- The last entry in `v` can be accessed by index `length(v)`.
- The [`tail(v, n)`][ref-tail] function is convenient to read (but not modify) the end of a vector.
  Argument `v` is the vector, `n` is the number of entries to return, with a default of 6.

## 2. Increment today's count

- You could use index `length(v)` to access today's entry.
- Alternatively, add the appropriate length-7 vector.
- To construct a vector with repeating entries, the [`rep()`][ref-rep] function may be useful.

## 3. Check if there was a day with no visiting birds

- Is there `any` day with an entry of zero?

## 4. Calculate the number of visiting birds for the first number of days

- Filter on a range of days.
- You need the sum of this subset vector.

## 5. Calculate the number of busy days

- Filter on a condition.
- How long is the resulting subset?

## 6. Calculate the running total of bird visits over the last week

- The Introduction gives a clue to solving this task.

## 7. Sort day names by how busy they are

- There are various ways to solve this.
- An idiomatic approach orders the bird counts and uses that vector to index the day names.
- Remember that the busiest day should be element 1.

[ref-tail]:  https://www.rdocumentation.org/packages/utils/versions/3.2.4/topics/head
[ref-rep]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/rep
