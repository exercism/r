# Instructions

Your company has been working with mapping data to build web pages.
After some discussion, a decision is made to start using R to perform some calculations dynamically.

Please aim to work directly with the vector points: there is no need to unpack them into separate `x` and `y` coordinates.

## 1. Scale the coordinates

Implement the `scale(point, scaling)` function that takes a point with arbitrary number of dimensions, and scales it by the pre-defined `scaling`.

```R
# A 2D example
scaling <- c(0.5, 0.8)
point <- c(10, 5)
scale(point, scaling)
#> [1] 5 4
```

## 2. Translate the coordinates

Implement the `translate(point, ...)` function that returns a new point, with each coordinate moved by the values in the ellipses.

This function must be able to handle points of any dimension, with the number of dot args matching that dimension.

```R
point2d <- c(2, 3)

# supply dx, dy translations
translate(point2d, 0.5, 0.6)
#> [1] 2.5 3.6

point3d <- c(2, 3, 4)

# supply dx, dy, dz translations
translate(point3d, 0.5, 0.6, 0.7)
#> [1] 2.5 3.6 4.7
```

## 3. Transform a 2D point

Some of your teammates are less experienced with R, so you decide to use a function closure to create reusable transformations for `{x, y}` coordinate pairs.

Implement the `transform2d(dx, dy, s)` function that returns a function making use of a closure to perform a repeatable 2d translation and scaling of a point.

The scaling argument `s` should be optional, with a default value of `1`.

The returned function should take a 2D point, then:

1. translate it by the pre-defined `dx` and `dy`
2. scale it by `s`

```R
# scale all coordinates by the same amount (2) in this example
# your code needs to be able to handle a vector `s`

tf2d <- transform2d(0.5, 0.6, 2)
class(tf2d)
#> [1] "function"

tf2d(c(2, 3))
#> [1] 5.0 7.2

# Accept default for `s`
tf2d <- transform2d(0.5, 0.6)

tf2d(c(2, 3))
#> 2.5 3.6
```

The order of operations is important: translate-then-scale gives the correct result, scale-then-translate does not.
In technical language, the operations _do not commute_.

## 4. Transform a 3D point

Mapping data can also contain heights, used to add shading and contours on screen.

Implement the `transform3d(dx, dy, dz, s)` function that returns a function.

The scaling argument `s` should be optional, with a default value of `1`.

The returned function should take a 3D point, translate it by the pre-defined values, then scale it by `s`.

```R
# using default `s`
tf3d <- transform3d(0.5, 0.6, 0.7)
point <- c(2, 3, 4)
tf3d(point)
#> [1] 2.5 3.6 4.7

# using vector `s`
tf3d <- transform3d(0.5, 0.6, 0.7, c(0.5, 0.6, 0.7))
tf3d(point)
#> [1] 1.25 2.16 3.29
```
