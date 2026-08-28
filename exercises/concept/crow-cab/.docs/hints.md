# Hints

To help conceptualize: the exercise is using complex numbers to encode intersections on a grid.
Since complex numbers can be thought of as a pair of two numbers, this can also be reimagined as the 2D x-y plane, with x-axis = real-axis and y-axis = imaginary-axis.

## 1. Simple Complex Number

- This is a simple wrapper function.
- See the Introduction for how to create a complex number using variables.
- Beware that, if you do not use the keyword arguments, the positional arguments for `complex()` might not be what you expect.

## 2. Get Driver Directions

- This function requires a single mathematical operation.
- The order of the operation matters (i.e. it is not symmetric)

## 3. Get Manhattan Distance

- Remeber, this is the total number of intersections (not including the starting intersection) passed through by the cab while following the grid lines.
- Your function `driver_directions` can be helpful.
- Other functions that may be helpful are [`Re()` and `Im()`][complex-ref].

## 4. Get "As the Crow Flies" Distance

- This is the straight-line distance between the two intersections.
- You can think of this as the hypotenuse of the path traced by a Manhattan distance with one turn.
- This is also known as the [Euclidean distance][euclid-ref] (aka L2 norm).
- Yor function `driver_directions` can be helpful.
- See the Introduction for another complex number function that can optionally be used to find the magnitude.

## 5. Get Crow Directions

- Your `driver_directions` function can be useful.
- This function flips the north/south directions of the driver's directions.
- This flips the perceived location over the "x-axis".
- See the Introduction for another function that can optionally be used.

[complex-ref]: https://www.rdocumentation.org/packages/base/versions/3.5.3/topics/complex
[euclid-ref]: https://en.wikipedia.org/wiki/Euclidean_distance
