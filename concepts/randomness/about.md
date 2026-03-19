# About

Many programs need (apparently) random values to simulate real-world events.

Common and familiar examples include:

- A coin flip: a random value that is `"H"` or `"T"`.
- The roll of a die: a random integer from 1 to 6.
- Shuffling a deck of cards: a random ordering of a card list.

Generating truly random values with a computer is a [surprisingly difficult technical challenge][web-truly-random], so you may see these results referred to as "pseudorandom".

***Important***: This Concept does *not* cover cryptographically secure random numbers, which are a much more difficult challenge.

However, R was derived from a statistics package and is often used for simulations, so it offers a rich variety of ways to generate random values.
The results are amply good enough for most applications in modelling, simulation and games.

~~~~exercism/note
Code examples in this concept produce random output, by definition.

If you want reproducible output, see the section on seeds, near the end of this document.
~~~~

## [Sampling with or without replacement][yt-sampling-with-replacement]

Imagine that we have a bag containing 3 red balls and 4 green balls, and we randomly pull a ball from the bag.
To get a second ball, there are two possibilities:

1. Replace the first ball in the bag and give everything a good shake before pulling out another.
   The number of balls is now the same as before (7), and *the ratio of red to green is also the same*.
2. Put the first ball on the table before pulling out a second.
   Now there are only 6 balls in the bag, and *the red:green ratio depends on the color of the first ball*.

Scenario 1 is with replacement, scenario 2 is without, and *they give different results*.

## Discrete values with `sample`

To pick from a limited number of discrete values, [`sample()`][ref-sample] can be used with or without replacement.
This is useful for integers, strings, etc.

```R
> sample(1:10, 5) # no repeats by default
[1] 8 3 4 2 6

> sample(1:10, 5, replace = TRUE) # repeats are OK
[1] 10 10  7 10  9

> languages <- c("Fortran", "R", "Python", "Julia")
> sample(languages, 1)
[1] "Python"

> sample(c("H", "T"), 5, replace = TRUE) # coin flips
[1] "T" "T" "H" "H" "H"

> sample(c(TRUE, FALSE), 5, replace = TRUE) # alternative coin flips
[1] FALSE  TRUE FALSE  TRUE  TRUE
```

Sampling fits well into data pipelines.
For example, to generate random alphanumneric strings:

```R
library(stringr)

> c(letters, LETTERS, 0:9) |> sample(50) |> str_flatten()
[1] "5tX71jhbM9zUmKrpENBQyGYaZdJPVAx06leSF2s8gcfw3OviIH"
```

Also, sampling is not limited to vectors and ranges.
We will see in other concepts that [lists][concept-lists], matrices and dataframes are all valid inputs.
*Exactly as you should expect for R*.

## Shuffling

Several other languages have a special function to shuffle a sequence: `random.shuffle()` in Python, `shuffle()` in Julia, `randperm()` in Matlab, among others.

R has no shuffle function.
*Why?*

To understand this, look again at the [`sample`][ref-sample] function.

The full form is `sample(x, size, replace = FALSE, prob = NULL)`, where `x` is (usually) the sequence to sample from and `size` is the number of items to choose.

We already discussed `replace`, where the default is sampling without replacement.
For now, ignore `prob`, which allows you to give unequal weights to the various elements in `x`.

What happens if we omit `size` and just provide `x`?

```R
> x <- letters[1:6]
> x
[1] "a" "b" "c" "d" "e" "f"
> sample(x)
[1] "e" "a" "f" "b" "c" "d"
```

In typical R style, the pattern is vector-in, vector-out, and `size` defaults to `length(x)`.

R is largely written by and for statisticians, who understand that "sample all elements of `x` without replacement" is just a more technical way to say "shuffle `x`".

*Thus*, there is no `shuffle` function, because `sample` already does exactly what we need!

## Working with Distributions

The examples above described cases where all outcomes are equally likely.
For example, `sample(1:100)` is equally likely to give any integer from 1 to 100.

This is called a [`uniform`][web-uniform] distribution.

Many real-world situations are far less simple than this.
As a result, statisticians have created a wide variety of [`distributions`][wiki-probability-distribution] to describe "real world" results mathematically.

Base R supports more distributions than you are likely to have heard of, and others are available in open-source packages.

The rest of this document describes only a few of the most common distributions.

## Floating-point numbers

### Uniform distribution

For an [equally-weighted distribution][wiki-uniform] of floating-point numbers use [`runif()`][ref-runif] (concentrate on "**r**andom-**unif**orm", and fight against the natural but *wrong* tendency to read it as "run if").
Both `min` and `max` can be specified but default to 0 and 1.

```R
> runif(5)  # generate 5 values
[1] 0.3038506 0.3527959 0.3319309 0.4846354 0.4386279

# generate 5 non-negative values <= 100.0
> runif(5, max = 100)
[1] 79.70762 51.62232 52.85281 71.08571 63.94380
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

<!-- There will be more to say about this in the [`Statistics`][statistics] Concept. -->

To generate random values with this distribution, R has the [`rnorm()`][ref-rnorm] function.

Short for "random normal", this defaults to `mean` 0 and `sd` 1.

```R
> rnorm(5)
[1]  0.36965357  0.07489948 -0.83827224 -0.83126506 -0.59895825

# Simulating our bolts example
> rnorm(5, mean = 4.731, sd = 0.2)
[1] 4.564521 4.613237 4.419512 4.772196 4.839102
```

It is hard to tell from looking at the numbers that the raw output clusters closer to the mean than for a uniform distribution.
If you doubt it, generate 1000 or more and plot them to make it more obvious.
Students without RStudio (or similar) installed locally can use an online R runner such as [rdrr.io][web-rdrr] or [WebR ggplot2 Playground][web-ggplot].

The code `hist(rnorm(10000), breaks = 40)` will show the basic pattern, though not in the most elegant presentation.
The random numbers are binned, and the vertical axis is a count of results in each bin.

~~~~exercism/advanced
The names of R's distribution functions have a prefix letter followed by an abbreviated distribution name.

The prefix letters are:

- `d` : Density - the value of the probability density function at a point
- `p` : Distribution function - the [cumulative distribution function][wiki-cdf] from a point
- `q` : Quantile function - the inverse cumulative distribution function
- `r` : Random generation - random samples from the distribution

We will focus mainly on the `r*()` functions, and leave [the others][web-statology-norm] to students with a statistical background.

[web-statology-norm]: https://www.statology.org/dnorm-pnorm-rnorm-qnorm-in-r/
[wiki-pdf]: https://en.wikipedia.org/wiki/Probability_density_function
[wiki-cdf]: https://en.wikipedia.org/wiki/Cumulative_distribution_function
~~~~

## Discrete distributions

### Binomial distribution

If you flip a coin (*without cheating*), there is an equal chance of getting heads or tails: both have probability `p = 0.5`.

If you flip the coin 20 times, how many times will you get heads?
It could be zero, it could be twenty, but even someone with no statistical training is likely to guess "*about 10*".

The ratio of probabilities for 0 or 1 heads for a single flip is `1:1`.

For two flips, 0, 1 or 2 heads have ratios `1:2:1`, for 3 flips `1:3:3:1`.

These ratios are called ["binomial coefficients"][wiki-binom-coeff].
They build up [Pascal's Triangle][wiki-pascal-triangle], and many Exercism tracks, including R, have a [practice exercise][practice-pascal] based on it.

If instead we want the probability of a particular result, R provides the [`dbinom()`][ref-rbinom] function (which calculates [probability density][wiki-pdf]).
There is almost 18% chance if getting 10 heads from 20 flips.

```R
> # Probability of exactly 10 heads in 20 flips, fair coin
> dbinom(10, size = 20, prob = 0.5)
[1] 0.1761971
```

Cheating is possible, so increasing the chance of a head to `p = 0.6` *reduces* the probability of 10 heads:

```R
# Probability of exactly 10 heads in 20 flips, biased coin
dbinom(10, size = 20, prob = 0.6)
[1] 0.1171416
```

It is now likely that there will be more than 10 heads from 20 flips.
Clearly, we need to be interested in all the possible outcomes: the [binomial distribution][wiki-binomial].

R provides the [`rbinom()`][ref-rbinom] function to generate random values with a binomial distribution.
Tell it how many values to return `n`, how many trials `size` (such as coin flips), and the probability of a single event `prob` (such as getting a head from one flip).

To simulate our coin flips, run this code somewhere that can show graphical output, as for the normal distribution:

```R
# fair coin
hist(rbinom(n = 10000, size = 20, prob = 0.5))

# biased coin
hist(rbinom(n = 10000, size = 20, prob = 0.6))
```

The resulting graph shows that the most likely number of heads is "about 10" and "about 12", respectively.

For 20 flips, the result is clearly discrete, with big steps on the histogram, but some approximation to "bell-like".

If we simulated millions of flips, using a fair coin for symmetry in the results, the binomial distribution becomes an increasingly good approximation to the (*continuous*) normal distribution.

### Poisson distribution

How many meteorites larger than 1m diameter strike the earth each year?

Everywhere on Earth has some (low) level of natural background radioactivity.
If you turn on a [Geiger counter][wiki-geiger], how many clicks per second will you hear from detecting particles of radiation?

Features of these examples include:

- Events are *independent* of each other.
- The probability of an event occurring in some interval remains constant.
- We are counting discrete events.
- There is no *theoretical* upper limit for the counts (though there may be practical constraints on the measurement).

The probabilities of getting 0, 1, 2... events in some interval form a [Poisson distribution][wiki-poisson].

The key parameter to a Poisson distribution is the [mean][ref-mean] (average) number of events in the chosen interval, usually represented by the Greek letter λ ('lambda').

The rate of earth-impacting meteorites at least 1 meter diameter is described in the literature as "every few months".

As an example, take `lambda = 4` and see what the distribution looks like with [`rpois()`][ref-rpois]:

```R
hist(rpois(n = 10000, lambda = 4))
```

Now the histogram is highly asymmetric, with a peak at 2 impacts and a long tail showing a non-zero count of 10 or more.

## Seeds

All the random functions described above aim to give different results each time they are run.
They are, after all, *random*!

This behavior relies on generating a different [random seed][wiki-seed] each time.

For debugging purposes, it may be helpful to use the [`set.seed(n)`][ref-set-seed] function, where `n` is your chosen integer.
By setting the same seed each time, our code will then return the same set of random values on each run.

```R
sample(1:5) #> [1] 5 1 2 4 3
sample(1:5) #> [1] 2 5 4 1 3
sample(1:5) #> [1] 4 2 5 1 3

set.seed(100); sample(1:5) #> [1] 2 3 5 4 1
set.seed(100); sample(1:5) #> [1] 2 3 5 4 1
set.seed(100); sample(1:5) #> [1] 2 3 5 4 1
```

For advanced users, `set.seed()` also allows you to specify the type of RNG (*Random Number Generator*) to use.

Apparently, the default is `"Mersenne-Twister"`, so make sure you understand what that means before you try to change it.
The authors of this Concept have no further advice to offer on RNGs.

## Other packages

Outside Exercism, there are many installable packages relating to randomness, probability and statistics.

Using them obviously requires some technical knowledge of statistics.

In many cases, packages also assume domain-specific expertise, typically in some branch of the medical or social sciences (epidemiology, psychology, anthropology... *the list is long*).

At the time of writing, the [CRAN][web-cran] package repository features 23,431 available packages.

It is only a slight exaggeration to say that many, perhaps most, of these packages are somebody's PhD thesis in executable form.

Many computer scientists think (*with some justification*) that R is a weird language.

Many statisticians and data scientists over the last few decades think that R fits them like a glove: *they are the target users*.

[wiki-normal-distribution]: https://simple.wikipedia.org/wiki/Normal_distribution
[wiki-probability-distribution]: https://simple.wikipedia.org/wiki/Probability_distribution
[yt-sampling-with-replacement]: https://www.youtube.com/watch?v=LnGFL_A6A6A
[wiki-standard-deviation]: https://simple.wikipedia.org/wiki/Standard_deviation
[web-truly-random]: https://www.malwarebytes.com/blog/news/2013/09/in-computers-are-random-numbers-really-random
[web-uniform]: https://www.investopedia.com/terms/u/uniform-distribution.asp#:~:text=In%20statistics%2C%20uniform%20distribution%20refers,a%20spade%20is%20equally%20likely.
[wiki-seed]: https://en.wikipedia.org/wiki/Random_seed
[wiki-uniform]: https://en.wikipedia.org/wiki/Continuous_uniform_distribution
[wiki-binomial]: https://en.wikipedia.org/wiki/Binomial_distribution
[wiki-binom-coeff]: https://en.wikipedia.org/wiki/Binomial_coefficient
[wiki-poisson]: https://en.wikipedia.org/wiki/Poisson_distribution
[wiki-pascal-triangle]: https://en.wikipedia.org/wiki/Pascal%27s_triangle
[wiki-pdf]: https://en.wikipedia.org/wiki/Probability_density_function
[wiki-geiger]: https://en.wikipedia.org/wiki/Geiger_counter
[web-rdrr]: https://rdrr.io/snippets/
[web-ggplot]: https://quesmaorg.github.io/webr-ggplot-playground/
[web-cran]: https://cran.r-project.org/
[ref-mean]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/mean
[ref-sample]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/sample
[ref-runif]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/Uniform
[ref-rnorm]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/Normal
[ref-rbinom]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/Binomial
[ref-rpois]: https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/Poisson
[ref-set-seed]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/Random
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[practice-pascal]: https://exercism.org/tracks/r/exercises/pascals-triangle
