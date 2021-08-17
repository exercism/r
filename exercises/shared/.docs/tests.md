# Tests

Tests require the `{testthat}` package to be installed in R.
To run the tests for an exercise, simply execute the `test_<exercise_name>.R` script from within the exercise's directory.

This can be conveniently done with [testthat's `auto_test` function](https://testthat.r-lib.org/reference/auto_test.html). Because exercism code and tests are in the same folder, use this same path for both `code_path` and `test_path` parameters. On the command-line, you can also run `Rscript test_<exercise_name>.R`.

See the [tests page](https://exercism.io/tracks/r/tests) for more information.
