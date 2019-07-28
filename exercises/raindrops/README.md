# Raindrops

Convert a number to a string, the contents of which depend on the number's factors.

- If the number has 3 as a factor, output 'Pling'.
- If the number has 5 as a factor, output 'Plang'.
- If the number has 7 as a factor, output 'Plong'.
- If the number does not have 3, 5, or 7 as a factor,
  just pass the number's digits straight through.

## Examples

- 28's factors are 1, 2, 4, **7**, 14, 28.
  - In raindrop-speak, this would be a simple "Plong".
- 30's factors are 1, 2, **3**, **5**, 6, 10, 15, 30.
  - In raindrop-speak, this would be a "PlingPlang".
- 34 has four factors: 1, 2, 17, and 34.
  - In raindrop-speak, this would be "34".

## Installation
See [this guide](https://exercism.io/tracks/r/installation) for instructions on how to setup your local R environment.

## How to implement your solution
In each problem folder, there is a file named `<exercise_name>.R` containing a function that returns a `NULL` value. Place your implementation inside the body of the function.

## How to run tests
Inside of RStudio, simply execute the `test_<exercise_name>.R` script. This can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because exercism code and tests are in the same folder, use this same path for both `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.

## Source

A variation on a famous interview question intended to weed out potential candidates. [http://jumpstartlab.com](http://jumpstartlab.com)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
