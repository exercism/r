# Hints

## General

- It is possible, but not required, to solve every task with a single statement inside the function body.


## 1. Determine if a card is present

- Is the card [in][ref-match] the stack?

## 2. Find the position of a card

- Is the card in the stack?
- If so, at [which][ref-which] position?
- The cards are all guaranteed to be different, making the task simpler.
- Return either the position, or `-1`.
  - See the [Conditionals Concept][concept-conditionals] for various ways to branch if something is `TRUE` or `FALSE`.
  - If using [`if_else`][ref-if_else] (the most modern approach, but not really required here), be aware that it is strict about both branches returning the same type of result. You may need to explicitly return a single element, rather than a vector which might be empty.
  - To get the first element of a vector, just add `[1]`  after anything that returns a vector.

## 3. Determine if each card is even

- The remainder operator is `%%`.
- `x` is even if `x %% 2 == 0`.
- Do [all][ref-all] the cards match this criterion?

## 4. Check if the stack contains an odd-value card

- A card is odd if it is not even, so see the previous task.
- Does [any][ref-any] card match this criterion?

## 5. Get the first odd card from the stack

- Is there an odd card in the stack?
- If so, return the first _card_ (not the position).

## 6. Determine the position of the first card that is even

- Is there an even card in the stack?
- If so, return the _position_ of the first even card.

[ref-match]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/match
[ref-which]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/which
[concept-conditionals]: https://exercism.org/tracks/r/concepts/conditionals
[ref-all]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/all
[ref-any]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/any
[ref-if_else]: https://dplyr.tidyverse.org/reference/if_else.html
