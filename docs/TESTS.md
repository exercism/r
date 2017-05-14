# How to test/verify your solution

Each problem will have a script named something like `test_problem.R` (e.g. `test_hello-world.R`). In RStudio, you can simply run this script to test your solution. What this will do is load your solution code through the `source` command on the first line, and then the suite of `testthat` tests below.

That can be conveniently done with [testthat's `auto_test` function](https://www.rdocumentation.org/packages/testthat/topics/auto_test). Because exercism code and tests are in the same folder, use this same path for both  `code_path` and `test_path` parameters. 

If you prefer, you can also run the tests on the command line with `Rscript test_problem.R` (e.g. `Rscript test_hello-world.R`).
