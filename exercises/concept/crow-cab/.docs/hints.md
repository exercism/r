# Hints

## 1. Simple Complex Number

- This is a simple wrapper function.
- See the Introduction for how to create a complex number using variables.
- Beware that, if you do not use the keyword arguments, the positional arguments for `complex()` might not be what you expect.

## 2. Get Driver Directions

- This function requires a single mathematical operation.
- The order of the operation matters (i.e. it is not symmetric)

## 3. Get Manhattan Distance

- This is the total number of blocks traveled by the cab following the grid lines.
- Your function `driver_directions` can be helpful.
- Other functions that may be helpful are [`Re()` and `Im()][complex-ref].

## 4. Get "As the Crow Flies" Distance

- This is the straight-line distance between the two intersections.
- You can think of this as the hypotenuse to the Manhattan distance.
- Yor function `driver_directions` can be helpful.
- See the Introduction for another function that can optionally be used.

## 5. Get Crow Directions

- Your `driver_directions` function can be useful.
- This function flips the north/south directions of the driver's directions.
- This flips the perceived location over the "x-axis".
- See the Introduction for another function that can optionally be used.

[complex-ref]: https://www.rdocumentation.org/packages/base/versions/3.5.3/topics/complex
