# Introduction

`Complex numbers` are not complicated.
They just need a less alarming name.

They are so useful, especially in engineering and science, that R includes [complex numbers][web-complex] as standard 
[atomic types][ref-atomic] alongside integer, double, logical, character and raw.

## Basics

A `complex` number in R is a single value.
In use, however, it can be thought of as a pair of numbers.
These are called the "real" and "imaginary" parts, for unfortunate historical reasons.
Again, it is best to focus on the underlying simplicity and not the strange names.

To create complex numbers from two real numbers, just add the suffix `i` to the imaginary part.

```r
2+3i
#> [1] 2+3i

typeof(2+3i)
#> [1] "complex"
```

To create a complex number from real variables, the above syntax will not work.
Writing `r + imi` confuses the parser into thinking `imi` is a (non-existent) variable name.

Either multiply the imaginary part by `1i` or use the [`complex()`][ref-complex] function:

```r
r <- 2
im <- 3

r + im * 1i
#> [1] 2+3i

# must include the `real` and `imaginary` keywords
complex(real = r, imaginary = im)
#> [1] 2+3i
```

You may wonder, why `i` rather than `j`?

Most engineers prefer `j`.
Most scientists and mathematicians prefer the mathematical notation `i` for _imaginary_, but that notation conflicts
with the use of `i` to mean _current_ in Electrical Engineering.

R chose `i`, Python chose `j`, and Julia sidestepped the controversy by choosing `im`.
Be careful when switching between [STEM][wiki-STEM] programming languages.

To access the parts of a complex number individually:

```r
z <- 2+3i

Re(z)  # real part
#> [1] 2

Im(z)  # imaginary part
#> [1] 3
```

Either part can be zero and mathematicians may then talk of the number being "wholly real" or "wholly imaginary".
However, it is still a complex number in R.

```r
1.2 + 0i
#> [1] 1.2+0i

typeof(1.2 + 0i)
#> [1] "complex"

2i
#> [1] 0+2i

typeof(2i)
#> [1] "complex"
```

You may have heard that "`i` (or `j`) is the square root of -1".

For now, all this means is that the imaginary part _by definition_ satisfies the following equality:

```r
1i * 1i == -1  # more precisely, 1i * 1i == -1 + 0i
#> [1] TRUE
```

This is a simple idea, but it leads to interesting consequences.

## Arithmetic

Most of the [`operators`][ref-operators] used with floats and integers also work with complex numbers:

```r
z1 = 1.5 + 2i
z2 = 2 + 1.5i

z1 + z2  # addition
#> [1] 3.5+3.5i

z1 * z2  # multiplication
#> [1] 0+6.25i

z1 / z2  # division
#> [1] 0.96+0.28i

z1^2  # exponentiation
#> [1] -1.75+6i

2^z1  # another exponentiation
#> [1] 0.518895+2.780422i
```

Explaining the rules for complex number multiplication and division is out of scope for this concept (_and you are unlikely to have to perform those operations "by hand" very often_).

Any [mathematical][web-math-complex] or [electrical engineering][web-engineering-complex] introduction to complex numbers will cover this, should you want to dig into the topic.

Alternatively, Exercism has a [`Complex Numbers`][exercise-complex-numbers] practice exercise where you can implement a complex number class with these operations from first principles.

Integer division is generally ___not___ possible on complex numbers, so the `%/%` and `%%` operators will fail for 
the complex number type.

## Functions

Most mathematical functions will work with complex inputs.

However, providing real inputs and expecting a complex output will not usually work.

```r
sqrt(z1)
#> [1] 1.414214+0.707107i

sqrt(-1)  # fails!
#> Warning in sqrt(-1) : NaNs produced
#> [1] NaN

sqrt(-1 + 0i)  # succeeds with complex input
#> [1] 0+1i

sin(z1)
#> [1] 3.752771+0.256554i
```

There are several functions, in addition to `Re()` and `Im()`, with particular relevance for complex numbers.

- `Conj()` simply flips the sign of the imaginary part of a complex number (_from + to - or vice-versa_).
  - Because of the way complex multiplication works, this is more useful than you might think.
- `abs(<complex number>)` is guaranteed to return a real number with no imaginary part (its "magnitude"), and `Mod(<complex number>)` is a synonym.
- `Arg(<complex number>)` returns the phase angle in radians.

```r
z1
#> [1] 1.5+2i

abs(z1)
#> [1] 2.5

Mod(z1)  # same as previous
#> [1] 2.5

Conj(z1)  # flip sign
#> [1] 1.5-2i

Arg(z1)
#> [1] 0.9272952
```

[web-complex]: https://www.cfm.brown.edu/people/dobrush/am33/R/intro/complex0.html
[ref-atomic]: https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Vectors
[ref-complex]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/complex
[web-math-complex]: https://www.nagwa.com/en/videos/143121736364/
[web-engineering-complex]: https://www.khanacademy.org/science/electrical-engineering/ee-circuit-analysis-topic/ee-ac-analysis/v/ee-complex-numbers
[ref-operators]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html
[wiki-STEM]: https://en.wikipedia.org/wiki/Science,_technology,_engineering,_and_mathematics
[exercise-complex-numbers]: https://exercism.org/tracks/r/exercises/complex-numbers
