# About


`Complex numbers` are not complicated.
They just need a less alarming name.

They are so useful, especially in engineering and science, that R includes [complex numbers][complex] as standard 
[atomic types][atomic] alongside integer, double, logical, character and raw.

## Basics

A `complex` number in R is a single value.
In use, however, it can be thought of as a pair of numbers: usually but not always floating-point.
These are called the "real" and "imaginary" parts, for unfortunate historical reasons.
Again, it is best to focus on the underlying simplicity and not the strange names.

To create complex numbers from two real numbers, just add the suffix `i` to the imaginary part.

```r
> 2+3i
[1] 2+3i

> typeof(2+3i)
[1] "complex"
```

To create a complex number from real variables, the above syntax will not work.
Writing `r + imi` confuses the parser into thinking `imi` is a (non-existent) variable name.

Either multiply the imaginary part by `1i` or use the `complex()` function:

```r
> r <- 2
> im <- 3

> r + im * 1i
[1] 2+3i

> complex(real = r, imaginary = im)
[1] 2+3i
```

You may wonder, why `i` rather than `j`?

Most engineers prefer `j`.
Most scientists and mathematicians prefer the mathematical notation `i` for _imaginary_, but that notation conflicts
with the use of `i` to mean _current_ in Electrical Engineering.

R chose `i`, Python chose `j`, and Julia sidestepped the controversy by choosing `im`.
Be careful when switching between [STEM][STEM] programming languages.

To access the parts of a complex number individually:

```r
> z <- 2+3i

> Re(z)  # real part
[1] 2

> Im(z)  # imaginary part
[1] 3
```

Either part can be zero and mathematicians may then talk of the number being "wholly real" or "wholly imaginary".
However, it is still a complex number in R.

```r
> 1.2 + 0i
[1] 1.2+0i

> typeof(1.2 + 0i)
[1] "complex"

> 2i
[1] 0+2i

> typeof(2i)
[1] "complex"
```

You may have heard that "`i` (or `j`) is the square root of -1".

For now, all this means is that the imaginary part _by definition_ satisfies the following equality:

```r
> 1i * 1i == -1
[1] TRUE
```

This is a simple idea, but it leads to interesting consequences.

## Arithmetic

Most of the [`operators`][operators] used with floats and integers also work with complex numbers:

```r
> z1 = 1.5 + 2i
> z2 = 2 + 1.5i

> z1 + z2  # addition
[1] 3.5+3.5i

> z1 * z2  # multiplication
[1] 0+6.25i

> z1 / z2  # division
[1] 0.96+0.28i

> z1^2  # exponentiation
[1] -1.75+6i

> 2^z1  # another exponentiation
[1] 0.518895+2.780422i
```

Explaining the rules for complex number multiplication and division is out of scope for this concept (_and you are unlikely to have to perform those operations "by hand" very often_).

Any [mathematical][math-complex] or [electrical engineering][engineering-complex] introduction to complex numbers will cover this, should you want to dig into the topic.

Alternatively, Exercism has a `Complex Numbers` practice exercise where you can implement a complex number class with these operations from first principles.

Integer division is generally ___not___ possible on complex numbers, so the `%/%` and `%%` operators will fail for 
the complex number type.

## Functions

Most mathematical functions will work with complex inputs.

However, providing real inputs and expecting a complex output will not usually work.

```r
> sqrt(z1)
[1] 1.414214+0.707107i

> sqrt(-1)  # fails!
Warning in sqrt(-1) : NaNs produced
[1] NaN

> sin(z1)
[1] 3.752771+0.256554i
```

There are several functions, in addition to `Re()` and `Im()`, with particular relevance for complex numbers.
Please skip over these if they make no sense to you!

- `Conj()` simply flips the sign of the imaginary part of a complex number (_from + to - or vice-versa_).
    - Because of the way complex multiplication works, this is more useful than you might think.
- `abs(<complex number>)` is guaranteed to return a real number with no imaginary part and `Mod(<complex number>)` 
  is a synonym.
- `Arg(<complex number>)` returns the phase angle in radians.

```r
> z1
[1] 1.5+2i

> abs(z1)
[1] 2.5

> Mod(z1)  # same as previous
[1] 2.5

> Conj(z1)  # flip sign
[1] 1.5-2i

> Arg(z1)
[1] 0.9272952
```
A partial explanation, for the mathematically-minded _(again, feel free to skip)_:

- The `(real, imag)` representation of `z1` in effect uses Cartesian coordinates on the complex plane.
- The same complex number can be represented in `(r, θ)` notation, using polar coordinates.
- Here, `r` and `θ` are given by `abs(z1)` and `Arg(z1)` respectively.

Here is an example using some constants:

```r
 euler <- exp(1i * pi)

> euler
[1] -1+0i
```

So a simple expression with three of the most important constants in nature `e`, `i` (or `j`) and `pi` gives the result `-1`.
Some people believe this is the most beautiful result in all of mathematics.
It dates back to around 1740.

-----

## Optional section: a Complex Numbers FAQ

This part can be skipped, unless you are interested.

### Isn't this some strange new piece of pure mathematics?

It was strange and new in the 16th century.

500 years later, it is central to most of engineering and the physical sciences.

### Why would anyone use these?

It turns out that complex numbers are the simplest way to describe anything that rotates or anything with a wave-like property.
So they are used widely in electrical engineering, audio processing, physics, computer gaming, and navigation - to name only a few applications.

You can see things rotate.
Complex numbers may not make the world go round, but they are great for explaining _what happens_ as a result of the world going round: look at any satellite image of a major storm.

Less obviously, sound is wave-like, light is wave-like, radio signals are wave-like, and even the economy of your home country is at least partly wave-like.

A lot of this wave processing can be done with trig functions (`sin()` and `cos()`) but that gets messy quite quickly.

Complex exponentials are ___much___ easier to work with.

### But I don't need complex numbers!

Only true if you are living in a cave and foraging for your food.

If you are reading this on any sort of screen, you are utterly dependent on some useful 20th-Century advances made through the use of complex numbers.

1. __Semiconductor chips__.
    - These make no sense in classical physics and can only be explained (and designed) by quantum mechanics (QM).
    - In QM, everything is complex-valued by definition. (_it's waveforms all the way down_)

2. __The Fast Fourier Transform algorithm__.
    - FFT is an application of complex numbers, and it is in _everything_ connected to sound transmission, audio processing, photos, and video.

    - MP3 and other audio formats use FFT for compression, ensuring more audio can fit within a smaller storage space.
    - JPEG compression and MP4 video, among many other image and video formats, also use FFT for compression.

    - FFT is also deployed in the digital filters that allow cellphone towers to separate your personal cell signal from everyone else's.

So, you are probably using technology that relies on complex number calculations thousands of times per second.


[complex]: https://www.cfm.brown.edu/people/dobrush/am33/R/intro/complex0.html
[atomic]: https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Vectors
[math-complex]: https://www.nagwa.com/en/videos/143121736364/
[engineering-complex]: https://www.khanacademy.org/science/electrical-engineering/ee-circuit-analysis-topic/ee-ac-analysis/v/ee-complex-numbers
[operators]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html
[STEM]: https://en.wikipedia.org/wiki/Science,_technology,_engineering,_and_mathematics
