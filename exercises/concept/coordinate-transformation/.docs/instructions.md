# Instructions

Your design company has primarily been working with CSS transformations to build web pages.
After some discussion, a decision is made to start using R to perform some calculations dynamically.

Some of your teammates are less experienced with R, so you decide to use a function closure to create reusable transformations for `{x, y}` coordinate pairs.

## 1. Move the coordinates

Implement the `move(x, y, dx, dy)` function that returns a new point `c(x1, y1)`, with `x, y` moved by `dx, dy`.

Arguments `x` and `y` are rquired.
`dx` and `dy` are optional, with both defaulting to `0.1`

```R
move(2, 3, .5, .6)
#> [1] 2.5 3.6

move(2, 3)
#> [1] 2.1 3.1
```

## 2. Translate the coordinates

Implement the `translate2d(dx, dy)` function that returns a function making use of a closure to perform a repeatable 2d translation of a coordinate pair.

The returned function should take `x` and `y` coordinates of a point, and translate it by the pre-defined `dx` and `dy`.

```R
f <- translate2d(.5, .6)
class(f)
#> [1] "function"

f(2, 3)
#> [1] 2.5 3.6
```

## 3. Translate a point

A 2D point is a vector `c(x, y)`, and a translation is a delta `c(dx, dy)`.
Passing separate coordinates as arguments is inappropriate.

Implement the `translate_point(delta)` function that returns a function .

The returned function should take a 2D point, and translate it by the pre-defined `delta`.

```R
g <- translate_point(c(.5, .6))
g(c(2, 3))
#> [1] 2.5 3.6
```

Please aim to work directly with the vectors: there is no need to unpack them into separate `x` and `y` coordinates.

## 4. Scale the coordinates

Implement the `scale2d(scaling)` function that returns a function to perform a repeatable 2d scale of a coordinate pair.

The returned function should take a 2D point, and scale it by the pre-defined `scaling`.

```R
scaling <- c(0.5, 0.8)
h <- scale2d(scaling)

h(c(10, 5))
#> [1] 5 4
```
