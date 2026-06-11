# Instructions

We are starting up a cheese club, which will use ML to select new cheeses to offer our cheese-loving customers based on their histories and tastes.

New members are required to fill out an initial survey so we can gather some basic data to start with.
Through this, it's been found that there is a subset of emphatic clients who lack nuance in their critiques.
As this can end up irrevocably biasing a more nuanced algorithm, there is a separate algorithm set up to handle their needs.
You are asked to provide some helper functions to wrangle their data.

~~~~exercism/note
While there may be different ways to solve the following tasks, each can be solved with no more than two higher order functions.
~~~~

## 1. Classify customers

The rating system has a five star basis, which simply consists of integers `1:5`.
The emphatic customers will only give ratings of `1` or `5`, and we want to know if a customer exhibits this behavior.

Implement `all_15()` which takes a vector of ratings and returns `true` if all ratings are either `1` or `5`, and false otherwise.

```R
all_15(c(2, 3, 4, 4, 1))
#> [1] FALSE

all_15(c(1, 5, 5, 1, 5))
#> [1] TRUE
```

## 2. Name customers

We need to associate the customer name (or ID) with their ratings.

Implement `name_customers()`, which takes a vector of names and a list of ratings, and "zips" them into a list of lists.

Inner list elements should have names `name` and `rating`.

```R
names <- c("c1", "c2")
ratings <- list(c(2, 3, 5), c(1, 1, 5))
name_customers(names, ratings)
#> [[1]]
#> [[1]]$name
#> [1] "c1"

#> [[1]]$rating
#> [1] 2 3 5

#> [[2]]
#> [[2]]$name
#> [1] "c2"

#> [[2]]$rating
#> [1] 1 1 5
```

## 3. Separate out emphatic customers

We need to separate the more emphatic customers from the others.

Implement `emphatics()` which takes customers and ratings.
Returns a list restricted to those who only use only `1` or `5` star ratings.`

```R
# names and ratings as in the task 2 example

emphatics(names, ratings)
#> [[1]]
#> [[1]]$name
#> [1] "c2"

#> [[1]]$rating
#> [1] 1 1 5
```

## 4. Change ratings to binary

Since the emphatic customers only use `1` and `5` ratings, it will more computationally convenient if these are changed these to `0` and `1`.

Implement `to_binary()` which takes vector of emphatic ratings.
Returns binary ratings, where `1` has been changed to `0` and `5` has been changed to `1`.

```R
to_binary(c(1, 1, 5, 5, 1))
#> [1] 0 0 1 1 0
```
