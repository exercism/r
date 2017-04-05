# xR

Exercism problems in R

## Contributing Guide

- [Asking for help](#asking-for-help)
- [How to contribute](#how-to-contribute)
  * [Reporting or fixing bugs](#reporting-or-fixing-bugs)
  * [Reviewing issues and pull requests](#reviewing-issues-and-pull-requests)
  * [Porting exercises](#porting-exercises)
  * [Updating an exercise test suite](#updating-an-exercise-test-suite)
- [Repository structure and conventions](#repository-structure-and-conventions)
  * [Directory structure](#directory-structure)
  * [Exercise structure](#exercise-structure)
- [Writing an issue](#writing-an-issue)
- [Writing a pull request](#writing-a-pull-request)
- [Development Dependencies](#development-dependencies)
- [Example Solution](#example-solution)
- [Test Suite](#test-suite)
- [Running Tests](#running-tests)
- [R Style Guide](#style-guide)

### Asking for help
If stuck or in doubt just ask! We try our best to be friendly and helpful, so don't be shy!
- [gitter support](https://gitter.im/exercism/support): general questions about exercism, setup, track content etc.
- [gitter dev](https://gitter.im/exercism/dev): technical questions.

### How to contribute
As a first step we recommend you read the [contributing guide](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md).

#### Reporting or fixing bugs
Typical examples for a bug: A typo, a missing test case, an unclear or ambiguous problem description.
- If you are unsure whether you have really found a bug [just ask](#asking-for-help).
- To report a bug you can [write an issue](#writing-an-issue).
- If you have a fix you can [write a pull request](#writing-a-pull-request).

#### Reviewing issues and pull requests
If you have a dedicated opinion you are welcome to [write a comment](https://help.github.com/articles/commenting-on-a-pull-request/) for an [issue](https://github.com/exercism/xr/issues) or a [pull request](https://github.com/exercism/xr/pulls).
Please be detailed and include motivations or relevant links to support your opinion.

#### Porting exercises
Here is the [list of missing exercises](http://exercism.io/languages/r/todo). See here for more information about [porting an exercise](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md#porting-an-exercise-to-another-language-track).
Of course you can also add a totally new exercise, but it might be a good idea to first discuss it in one of [our forums](#asking-for-help).

#### Updating an exercise test suite
Updating the test suite of an existing exercise is a special case because it usually affects all languages. Read more about it [here](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md#updating-an-exercise-test-suite).
Note that the test suite must run within a couple of seconds.

### Repository structure and conventions
A general description of all the files and directories can be found [here](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md#track-anatomy).

#### Directory structure
```bash
├── bin
│ └── fetch‐configlet
├── docs
│ ├── ABOUT.md
│ ├── INSTALLATION.md
│ ├── LEARNING.md
│ ├── RESOURCES.md
│ └── TESTS.md
└── exercises
  ├── TRACK_HINTS.md
  └── <exercise-name>
  │ ├── <exercise-name>.R
  │ └── example.R
  │ └── test_<exercise-name>.R
  └── <exercise-name>
  │ ├── <exercise-name>.R
  │ └── example.R
  │ └── test_<exercise-name>.R
  └── ...
└── img
  └── icon.png
├── .gitignore
├── .travis.yml
├── LICENSE
├── README.md
└── config.json
```
- `config.json`: Note that every exercise has to be registered here, with a unique name and a difficulty. The sequence order in this file determines the default order in which the exercises are fetched.

#### Exercise structure
Each exercise has the following structure:
- `HINTS.md` is an optional file containing instructions and/or hints. It is used together with the respective `description.md` for the exercise from [x-common](https://github.com/exercism/x-common) to build the `README.md` file.
- `<exercise-name>.R` usually contains an empty function declaration, as a starting point for the required solution.
- `example.R` is the source code of the sample solution.
- `test_<exercise-name>.R` is the [test suite](#test-suite).

### Writing an issue
To report a bug you should [create an issue](https://help.github.com/articles/creating-an-issue/) [here](https://github.com/exercism/xr/issues).

### Writing a pull request
To fix a bug you should [create a pull request from a fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) [here](https://github.com/exercism/xr/pulls). See also [here](https://github.com/exercism/x-common/blob/master/CONTRIBUTING.md#git-basics) for more information.

### Development dependencies
You'll need to have a recent version of [R](https://cran.r-project.org/) installed on your system, as well as the `testthat` package (run `install.packages('testthat')` from the R console to install) in order to run tests.

### Example solution
The example solution doesn't have to be perfect, but should pass all of the tests and ideally also strive for a healthy balance of human readability and computational efficiency.

### Test suite
The test suite should be derived from the respective `x-common/exercises/<exercise-name>/canonical-data.json` and comply to some formatting and coding standards (to get an idea you can look at some of the existing tests).

### Running tests
To run the tests for an exercise, simply run `source('test_<exercise-name>.R')` from within the exercise's directory. Note that when testing locally you'll need to (temporarily) replace the first line of `test_<exercise-name>.R` (which sources `<exercise-name>.R`) with `source('example.R')`.

The example solutions must pass the tests without failures. Additionally the tests should not run longer than a few seconds.

In order to be accepted by Travis-CI, every exercise must be registered in `config.json`.

### Style guide
Given that there are a variety of R style guides in circulation, at this stage we don't enforce a particular style guide, but our preference is to have R code in this repository follow Hadley Wickham's [R style guide](http://adv-r.had.co.nz/Style.html).

You are thus encouraged to run [`lintr`](https://github.com/jimhester/lintr) on your R scripts before opening a [pull request](#writing-a-pull-request) in order to check that your code adheres to this style guide before submitting it for review.

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com

## R icon
The R logo was created by [Hadley Wickham](https://github.com/hadley) and others at [RStudio](https://www.rstudio.com/). The original file is licensed under version [4.0 of the Creative Commons Attribution-Share Alike license](https://creativecommons.org/licenses/by-sa/4.0/). We have adapted it, changing the colour scheme, for use on Exercism.
