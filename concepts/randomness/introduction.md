# Introduction

Many programs need (apparently) random values to simulate real-world events.

Common and familiar examples include:

- A coin flip: a random value that is `"H"` or `"T"`.
- The roll of a die: a random integer from 1 to 6.
- Shuffling a deck of cards: a random ordering of a card list.

Generating truly random values with a computer is a [surprisingly difficult technical challenge][web-truly-random], so you may see these results referred to as "pseudorandom".

***Important***: This Concept does *not* cover cryptographically secure random numbers, which are a much more difficult challenge.

However, R was derived from a statistics package and is often used for simulations, so it offers a rich variety of ways to generate random values.
The results are amply good enough for most applications in modelling, simulation and games.

## [Sampling with or without replacement][yt-sampling-with-replacement]

Imagine that we have a bag containing 3 red balls and 4 green balls, and we randomly pull a ball from the bag.
To get a second ball, there are two possibilities:

1. Replace the first ball in the bag and give everything a good shake before pulling out another.
   The number of balls is now the same as before (7), and *the ratio of red to green is also the same*.
2. Put the first ball on the table before pulling out a second.
   Now there are only 6 balls in the bag, and *the red:green ratio depends on the color of the first ball*.

Scenario 1 is with replacement, scenario 2 is without, and *they give different results*.

## Discrete values with `sample`

To pick from a limited number of discrete values, `sample()` can be used with or without replacement.
This is useful for integers, strings, etc.

```R
sample(1:10, 5) # no repeats by default
#> [1] 8 3 4 2 6

sample(1:10, 5, replace = TRUE) # repeats are OK
#> [1] 10 10  7 10  9

languages <- c("Fortran", "R", "Python", "Julia")
sample(languages, 1)
#> [1] "Python"

sample(c("H", "T"), 5, replace = TRUE) # coin flips
#> [1] "T" "T" "H" "H" "H"

sample(c(TRUE, FALSE), 5, replace = TRUE) # alternative coin flips
#> [1] FALSE  TRUE FALSE  TRUE  TRUE
```

Sampling fits well into data pipelines.
For example, to generate random alphanumneric strings:

```R
library(stringr)

c(letters, LETTERS, 0:9) |> sample(50) |> str_flatten()
#> [1] "5tX71jhbM9zUmKrpENBQyGYaZdJPVAx06leSF2s8gcfw3OviIH"
```

## Shuffling

Several other languages have a special function to shuffle a sequence.

R has no shuffle function.
*Why?*

To understand this, look again at the `sample` function.

The full form is `sample(x, size, replace = FALSE, prob = NULL)`, where `x` is (usually) the sequence to sample from and `size` is the number of items to choose.

We already discussed `replace`, where the default is sampling without replacement.
For now, ignore `prob`, which allows you to give unequal weights to the various elements in `x`.

What happens if we omit `size` and just provide `x`?

```R
x <- letters[1:6]
x
#> [1] "a" "b" "c" "d" "e" "f"
sample(x)
#> [1] "e" "a" "f" "b" "c" "d"
```

In typical R style, the pattern is vector-in, vector-out, and `size` defaults to `length(x)`.

"Sample all elements of `x` without replacement" is just a more technical way to say "shuffle `x`".

*Thus*, there is no `shuffle` function, because `sample` already does exactly what we need!

## Working with Distributions

The examples above described cases where all outcomes are equally likely.
For example, `sample(1:100)` is equally likely to give any integer from 1 to 100.

This is called a `uniform` distribution.

Many real-world situations are far less simple than this.
As a result, statisticians have created a wide variety of `distributions` to describe "real world" results mathematically.

## Floating-point numbers

### Uniform distribution

For an equally-weighted distribution of floating-point numbers use `runif()` (concentrate on "**r**andom-**unif**orm", and fight against the natural but *wrong* tendency to read it as "run if").
Both `min` and `max` can be specified but default to 0 and 1.

```R
runif(5)  # generate 5 values
#> [1] 0.3038506 0.3527959 0.3319309 0.4846354 0.4386279

# generate 5 non-negative values <= 100.0
runif(5, max = 100)
#> [1] 79.70762 51.62232 52.85281 71.08571 63.94380
```

### Normal/Gaussian distribution

Also called the "bell-shaped" curve, this is a very common way to describe imprecision in measured values.

For example, suppose the factory where you work has just bought 10,000 bolts which should be identical.
You want to set up the factory robot to handle them, so you weigh a sample of 100 and find that they have an average (or [`mean`][ref-mean]) weight of 4.731g.
This is extremely unlikely to mean that they all weigh exactly 4.731g.
Perhaps you find that values range from 4.627 to 4.794g but cluster around 4.731g.

This is the [`normal distribution`][wiki-normal-distribution] (or "Gaussian", after the mathematician Card Friedrich Gauss), for which probabilities peak at the mean and tail off symmetrically on both sides (hence "bell-shaped").

To simulate this in software, we need some way to specify the width of the curve (*typically, expensive bolts will cluster more tightly around the mean than cheap bolts!*).
By convention, this is done with the [`standard deviation`][wiki-standard-deviation]: small values for a sharp, narrow curve, large for a low, broad curve.

Mathematicians love Greek letters, so you will often see `μ` ('mu') to represent the mean and `σ` ('sigma') to represent the standard deviation (or `sd`).
Thus, if you read that "95% of values are within 2σ of μ" or "the Higgs boson has been detected with 5-sigma confidence", such comments relate to the standard deviation.

To generate random values with this distribution, R has the `rnorm()` function.

Short for "random normal", this defaults to `mean` 0 and `sd` 1.

```R
rnorm(5)
#> [1]  0.36965357  0.07489948 -0.83827224 -0.83126506 -0.59895825

# Simulating our bolts example
rnorm(5, mean = 4.731, sd = 0.2)
#> [1] 4.564521 4.613237 4.419512 4.772196 4.839102
```


[wiki-normal-distribution]: https://simple.wikipedia.org/wiki/Normal_distribution
[yt-sampling-with-replacement]: https://www.youtube.com/watch?v=LnGFL_A6A6A
[wiki-standard-deviation]: https://simple.wikipedia.org/wiki/Standard_deviation
[web-truly-random]: https://www.malwarebytes.com/blog/news/2013/09/in-computers-are-random-numbers-really-random
[ref-mean]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/mean
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
