# Hints

## 1. Determine how long it takes to mix a juice

- Look back to the [Switch][concept-switch] Concept for ways to approach this.

## 2. Replenish the lime wedge supply

- Loop until one of the conditions in the instructions is met.
- It may be helpful, though not required, to have a small helper function relating lime sizes to the number of wedges they make.
- Again, the [Switch][concept-switch] Concept may suggest convenient approaches.
- Return how many limes were actually cut.

## 3. List the times to mix each order in the queue

- At this stage of the syllabus, the easiest approach uses a `for` loop over `orders`, but it can also be done with `seq_along`.
- An earlier task may supply a useful function.
- [`print()`][print-function] the times in order (see introduction for example).
- You should not return anything for this exercise.

## 4. Finish up the shift

- Loop while there are orders and some time left.
- Return a vector of any orders not started.

[concept-switch]: https://exercism.org/tracks/r/concepts/switch
[concept-lapply]: https://exercism.org/tracks/r/concepts/lapply
[print-function]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/print
