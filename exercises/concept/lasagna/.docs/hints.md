# Hints 

## General

- You will need to define [functions][functions] and use [arithmetic operators][arithmetics].

## 1. Define the expected oven time in minutes

- Define the function zero-argument `expected_minutes_in_oven()`.
- In the body of the function, you can [assign][assign] this value to a variable and return it, or simply return the value.

## 2. Calculate the remaining oven time in minutes

- Define the single argument function `remaining_time_in_minutes()`.
- Use the [`minus` arithmetic operator][arithmetics] to subtract the argument from `60`.

## 3. Calculate the preparation time in minutes

- Define the single argument function `prep_time_in_minutes()`.
- Use the [`times` arithmetic operator][arithmetics] to multiply the argument by `2`.

## 4. Calculate the elapsed time in minutes

- Define the two-argument function `elapsed_time_in_minutes()`.
- You can reuse the function `prep_time_in_minutes()` function defined in the previous task.
- Use the [`plus` arithmetic operator][arithmetics] to add the return value of `prep_time_in_minutes` to the argument.

[functions]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/function
[arithmetics]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/Arithmetic
[assign]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/assignOps
