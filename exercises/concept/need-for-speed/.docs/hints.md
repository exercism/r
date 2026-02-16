# Hints

## 1. Create a remote controlled car

- Return a list with 4 named elements.
- `speed` and `battery_drain` are supplied as arguments.
- `battery` and `distance` take default values.

## 2. Create a race track

- return a length-1 list.

## 3. Check for a drained battery

- To count as "drained", the battery charge need not be zero, just low enough that another turn cannot be completed.

## 4. Drive the car

- Is the battery drained? If so, should the car be updated?
- `battery_drain` is the amount of charge lost on each turn.
- `speed` is the distance travelled each turn.
- Return an updated car, as appropriate.

## 5. Check if a remote controlled car can finish a race

- How many more turns can the car complete?
- There are no partial turns, so the [`floor`][ref-round] function may be useful.
- How far can the car travel in this number of turns?
- Is it enough?

## 6. Store whether the car can finish a track on a full battery

- Reset `battery` and `distance` to new car values before any calculations.
- Lists are _recursive_ vectors, so they can contain other lists.
- The name of the new element is supplied at run time, so the `$` notation will not work. The Introduction suggests alternatives.
- The value of the new element is a length-2 `list`. It cannot be a `vector`, because it mixes numeric and logical elements.
- Return the updated car.
- Assume that multiple track elements may be added, with different names.

[ref-round]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/Round
