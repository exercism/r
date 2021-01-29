# Allergies

Given a person's allergy score, determine whether or not they're allergic to a given item, and their full list of allergies.

An allergy test produces a single numeric score which contains the
information about all the allergies the person has (that they were
tested for).

The list of items (and their value) that were tested are:

* eggs (1)
* peanuts (2)
* shellfish (4)
* strawberries (8)
* tomatoes (16)
* chocolate (32)
* pollen (64)
* cats (128)

So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

Now, given just that score of 34, your program should be able to say:

- Whether Tom is allergic to any one of those allergens listed above.
- All the allergens Tom is allergic to.

Note: a given score may include allergens **not** listed above (i.e.
allergens that score 256, 512, 1024, etc.).  Your program should
ignore those components of the score.  For example, if the allergy
score is 257, your program should only report the eggs (1) allergy.

## Installation
See [this guide](https://exercism.io/tracks/r/installation) for instructions on how to setup your local R environment.

## How to implement your solution
In each problem folder, there is a file named `<exercise_name>.R` containing a function that returns a `NULL` value. Place your implementation inside the body of the function.

## How to run tests
Inside of RStudio, simply execute the `test_<exercise_name>.R` script. This can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because exercism code and tests are in the same folder, use this same path for both `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.

## Source

Jumpstart Lab Warm-up [http://jumpstartlab.com](http://jumpstartlab.com)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
