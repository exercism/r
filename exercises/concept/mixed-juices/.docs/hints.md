# Hints

## 1. Determine how long it takes to mix a juice

- Look back to the [Switch][concept-switch] Concept for ways to approach this.

## 2. Replenish the lime wedge supply

- Loop until one of the conditions in the instructions is met.
- It may be helpful, though not required, to have a small helper function relating lime sizes to the number of wedges they make.
- Return how many limes were actually cut.

## 3. List the times to mix each order in the queue

- At this stage of the syllabus, the easiest approach uses a `for` loop with `seq_along`.
- An earlier task may supply a useful function.
- Return a vector of times.
- More experienced R programmers are free to use [`sapply()`][concept-lapply] if they prefer.

## 4. Finish up the shift

- Loop while there are orders and some time left.
- Return a vector of any orders not started.

[concept-switch]: https://exercism.org/tracks/r/concepts/switch
[concept-lapply]: https://exercism.org/tracks/r/concepts/lapply
