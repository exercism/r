# Introduction

The `switch()` function can be a concise replacement for a long series of `if` ... `else if` tests.
The variable being switched on is most commonly a string, and if so the quotes can be omitted from the selector.

```R
star <- function(type) {
  switch(type,
    M = , # will "fall through" if no value given
    K = "red dwarf",
    G = "Earth-like",
    "bigger star" # only correct for O,B,A,F
  )
}

> star("M")
[1] "red dwarf"
```

Note that options will only fall through if the value is left blank, as with `M` in the example above. 
There is no need to include `break` statements as with some other languages.

With character types, the final value can be a default, as here, or a `stop()` to throw an error if the conditions are intended to be exhaustive.
Switching on an integer is slightly different: for these the default is always `NULL`.
