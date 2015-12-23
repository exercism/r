## Installation
See [this guide](https://github.com/exercism/xr/blob/master/docs/INSTALLATION.md) for instructions on how to setup your local R environment.

## How the R files are organized and why
When a new exercism problem is fetched, what you get is a folder with this structure:

```
./Bob
├── Bob.Rproj
├── DESCRIPTION
├── NAMESPACE
├── R
│   └── bob.R
└── tests
    ├── testthat
    │   └── test_bob.R
    └── testthat.R
```

This is package skeleton created using `devtools::create`. Having a whole package to run tests for a single script adds a little bit of clutter and complexity, but it also provides some consistency and allows us to take advantage of tooling.

The intent is to structure problems within self-contained modules or classes as is done for other languages at exercism. Unfortunately, R does not support this pattern, hence this workaround (see [this Stack Overflow question](https://stackoverflow.com/questions/15789036/namespaces-without-packages) for more explanation).

## How to implement your solution in RStudio
In the example file tree above, there is a file called `Bob.Rproj`, which is an RStudio project file. Open it in RStudio.

In the `./Bob/R` folder, you will find a single script file (e.g. `bob.R`), which provides some skeleton code for you to implement your solution. Fill it in, and run the test suite (see next section).

## How to run tests inside of RStudio
If you opened the `RProj` file, the IDE will be configured to run the test suite for you. To run your tests, from the menu select `Build > Test Package` or use the keyboard shortcut `Cmd/Ctrl-Shift-T`. The test report should appear in one of the panels.

You can view the specs in the `./Bob/tests/testthat` folder.

## How to run tests on the command line
If you prefer to not use an IDE for your coding and test running, you will need to create a helper script. At the root of the problem folder, create this one-line script `run_tests.R`:

```
devtools::test()
```

Then, on the command line, type `Rscript run_tests.R` to run the test suite.
