# Instructions

Mary is a big fan of the TV series _Star Trek: The Next Generation_.
She often plays pen-and-paper role playing games, where she and her friends pretend to be the crew of the _Starship Enterprise_.

Mary's character is Captain Picard, which means she has to keep the captain's log.
She loves the creative part of the game, but doesn't like to generate random data on the spot.

Help Mary by creating random generators for data commonly appearing in the captain's log.

## 1. Generate random planets

The _Starship Enterprise_ encounters many planets in its travels.
Planets in the Star Trek universe are split into categories based on their properties.
For example, Earth is a class M planet. All possible planetary classes are: D, H, J, K, L, M, N, R, T, and Y.

Implement the `random_planet_class` function.
It should return the required number of planetary classes at random, as a vector.
Duplicates classes are acceptable, and may be required for long vectors.

```R
random_planet_class(number_needed)
#> "K"
```

### 2. Generate a random starship registry number

Enterprise (registry number NCC-1701) is not the only starship flying around!
When it rendezvous with another starship, Mary needs to log the registry number of that starship.

Registry numbers start with the prefix "NCC-" and then use a number from 1000 to 9999 (inclusive).

Implement the `random_ship_registry_number` function that returns a random starship registry number.

```R
random_ship_registry_number()
#> "NCC-1947"
```

# 3. Randomize a fleet of starships

One version of the game involves interacting with other starships, and Mary needs a selection.

There is a full list of possible starships, but only a few of these is needed in each game, and they should be chosen at random.

Implement the `shuffle_starships(starships)` function, which takes a vector of unique starship registry numbers, and returns a vector of the same length with starships in random order.
It will then be easy for Mary to take a random selection of any size from the start of the vector.

Result values should be taken from `starships`, with no duplicates.

```R
shuffle_starships(c("NCC-5011", "NCC-1228", "NCC-7039", "NCC-3978", "NCC-1476"))
#> [1] "NCC-5011" "NCC-7039"
```

## 4. Generate a random stardate

What's the use of a log if it doesn't include dates?

A stardate is a floating point number.
The adventures of the _Starship Enterprise_ from the first season of _The Next Generation_ take place between the stardates 41000.0 and 42000.0.
The "4" stands for the 24th century, the "1" for the first season.

Implement the function `random_stardate` that returns a floating point number between 41000.0 and 42000.0.

```R
random_stardate()
#> 41037.6
```
