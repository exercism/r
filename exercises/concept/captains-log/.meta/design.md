# Design

## Goal

The goal of this exercise is to teach the student about using random values in R.

## Learning objectives

- Understand `sample()`, with and without replacement.
- Understand `runif()` to get uniformly-distributed floating-point numbers.

## Out of scope

- Details of all the options used in statistical modeling. R has *many* of these.

## Concepts

This exercise unlocks no other concepts.

## Prerequisites

- `strings`

## Test runner considerations

In `test_captains-log.R`, `random_planet` needs enough runs to be pretty sure all possible values will be chosen.
- With 1000 (current setting), the chance of a false fail is 1.7e-46
- With 500, this is 1.3e-23
- We'll need to see timings for the test runner in real use
