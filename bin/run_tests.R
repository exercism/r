#!/usr/bin/env Rscript
# run_tests -- run R tests for exercism.io
# the following were useful in writing this script:
#   http://mazamascience.com/WorkingWithData/?p=888 for writing command line scripts
#   http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/ for using RUnit


# function to determine if a package is installed
# will install it if necessary and load it
# otherwise stops the script with an error message
# source: http://stackoverflow.com/q/9341635
install.if.necessary <- function(package.name) {
  if ( !require(package.name, character.only=TRUE) ) {
    install.packages(package.name, repos="http://cran.cnr.Berkeley.edu/")
    if ( !require(package.name, character.only=TRUE) ) stop( paste( package.name, " not found") )
  }
}

# make sure RUnit is installed and loaded
install.if.necessary("RUnit")

# define a test suite; looks for files named "^.*_test.R" in current directory 
test.suite <- defineTestSuite("exercism", dirs = getwd(), testFileRegex = "^.*_test\\.R" )

# run the tests
test.result <- runTestSuite(test.suite)

# output the result
printTextProtocol(test.result)