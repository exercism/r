# Fizz Buzz

Print numbers from 1 to n with the following exceptions:

1. When a number is a multiple of 3, then print "Fizz"
2. When a number is a multiple of 5, then print "Buzz"
3. When a number is both a multiple of 3 and a multiple of 5, then print "Fizz Buzz"

For example, when n=16 you should have an output as below (Hint: use `cat()`):

```text
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
Fizz Buzz
16
```

## Installation
See [this guide](https://exercism.io/tracks/r/installation) for instructions on how to setup your local R environment.

## How to implement your solution
In each problem folder, there is a file named `<exercise_name>.R` containing a function that returns a `NULL` value. Place your implementation inside the body of the function.

## How to run tests
Inside of RStudio, simply execute the `test_<exercise_name>.R` script. This can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because exercism code and tests are in the same folder, use this same path for both  `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.

## Source

This is a classic toy problem, but we were reminded of it by seeing it in the Go Tour.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
