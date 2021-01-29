# Triangle

Determine if a triangle is equilateral, isosceles, or scalene.

An _equilateral_ triangle has all three sides the same length.

An _isosceles_ triangle has at least two sides the same length. (It is sometimes
specified as having exactly two sides the same length, but for the purposes of
this exercise we'll say at least two.)

A _scalene_ triangle has all sides of different lengths.

## Note

For a shape to be a triangle at all, all sides have to be of length > 0, and
the sum of the lengths of any two sides must be greater than or equal to the
length of the third side. See [Triangle Inequality](https://en.wikipedia.org/wiki/Triangle_inequality).

## Dig Deeper

The case where the sum of the lengths of two sides _equals_ that of the
third is known as a _degenerate_ triangle - it has zero area and looks like
a single line. Feel free to add your own code/tests to check for degenerate triangles.


## Hint

For this exercise you will need to implement a simple S3 class. If you are not familiar with S3, a great starting point is the [chapter on S3](http://adv-r.hadley.nz/s3.html) in Hadley Wickham's book Advanced R.

## Installation
See [this guide](https://exercism.io/tracks/r/installation) for instructions on how to setup your local R environment.

## How to implement your solution
In each problem folder, there is a file named `<exercise_name>.R` containing a function that returns a `NULL` value. Place your implementation inside the body of the function.

## How to run tests
Inside of RStudio, simply execute the `test_<exercise_name>.R` script. This can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because exercism code and tests are in the same folder, use this same path for both `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.

## Source

The Ruby Koans triangle project, parts 1 & 2 [http://rubykoans.com](http://rubykoans.com)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
