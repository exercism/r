# Hints

## 1. Scale the coordinates

- The `point` is a vector, scaling is by a vector `s` (either explicitly a vector, or by recycling). - You already know about element-wise multiplication of vectors.

## 2. Translate the coordinates

- Convert the dot args to a vector.
- The usual [`c()`][ref-c] function is flexible enough to handle this.
- Unpacking vector elements into individual variables is typically _not_ a good way to use R: think in terms of vector operations.

## 3. Transform a 2D point

- Remember: translate, _then_ scale.
- Arguments to `transform2d()` are optional, so remember to define defaults.
- `transform2d()` needs to return a function which takes a `point` as its sole argument.
- If still confused, read the Introduction on environments and functions as return values, and look at the examples in the instructions.
- This is the sort of topic that can confusing at first, but becomes very natural with a bit of practice.

## 4. Transform a 3D point

- This is just an extension of task 3.
- It relies on tasks 1 and 2 being implemented in a simple, flexible way.

[ref-c]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/c
