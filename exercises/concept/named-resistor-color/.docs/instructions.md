# Instructions

If you want to build something using a Raspberry Pi, you'll probably use _resistors_.
For this exercise, you need to know two things about them:

- Each resistor has a resistance value.
- Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.

To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values.
Each band has a position and a numeric value.

The first 2 bands of a resistor have a simple encoding scheme: each color maps to a single number.

The third band is a multiplier.

In this exercise you are going to create a helpful program so that you don't have to remember the values of the bands.

More information on the color encoding of resistors can be found in the [Electronic color code Wikipedia article][e-color-code].

## 1. Define a named vector

The colors are encoded as follows:

- black: 0
- brown: 1
- red: 2
- orange: 3
- yellow: 4
- green: 5
- blue: 6
- violet: 7
- grey: 8
- white: 9

Create the named vector, `resistor_bands`, which should have the colors as the names and the numbers as the values.

## 2. Return the value associated with a band

First, you'll want to be able to find the single value for any colored band.

Define a function `band_value(band)` which takes a `string` of a band color.
The function returns the associated value for that color.

```R
band_value("green")
# => [1] 5

band_value("violet")
# => [1] 7
```

## 3. Return the value associated with two bands

The first two bands on a resistor combine to form a single number.
If the first two bands have respective numbers `m` and `n`, they combine to make the single number `mn`.

Define a function `two_band_value(bands)` which takes a `vector` of `string`s with two band colors.
The function returns the associated value for the combination of those two colors.

```R
two_band_value(c("yellow", "red"))
# => [1] 42

two_band_value(c("green", "violet"))
# => [1] 57
```

## 4. Return the ohms associated with all three bands

Finally, you'll need to find the full ohm rating using the first two bands in concert with the third.
To do that you'll need to find the two-band value and a multiplier.
The multiplier can be thought of as how many zeros are tacked onto the two-band value.

Define a function `ohms(bands)` which takes a `vector` of `string`s with three band colors.
The function returns the associated ohm rating for the combination of the three colors.

```R
ohms(c("yellow", "red", "orange"))
# => 42000

ohms(c("green", "violet", "yellow"))
# => 570000
```

[e-color-code]: https://en.wikipedia.org/wiki/Electronic_color_code
