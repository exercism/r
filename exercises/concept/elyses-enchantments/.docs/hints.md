# Hints

## 1. Retrieve a card from a stack

- `vector` indices start at `1`.
- You can retrieve the `n`th value in a vector `v` with `v[n]`.

## 2. Exchange a card in the stack

- `vector`s are mutable, you can change their contents at any time by assigning a new value.

## 3. Insert a card at the of top of the stack

- You can `c`oncatenate to add a new value to the end of a `vector`.

## 4. Remove a card from the stack

- See the introduction for how to delete an element from a `vector` at a given index.

## 5. Remove the top card from the stack

- You need to remove an element at the end of a `vector`.
- The `length` function might be useful here.

## 6. Insert a card at the bottom of the stack

- You can `c`oncatenate to add a new value to the beginning of a `vector`.

## 7. Remove a card from the bottom of the stack

- You need to remove an element at the beginning of a `vector`.

## 8. Check the size of the stack

- There is a method [`length`][length] in Base to retrieve the length of a collection.

[push]: https://docs.julialang.org/en/v1/base/collections/#Base.push!
[pop]: https://docs.julialang.org/en/v1/base/collections/#Base.pop!
[pushfirst]: https://docs.julialang.org/en/v1/base/collections/#Base.pushfirst!
[popfirst]: https://docs.julialang.org/en/v1/base/collections/#Base.popfirst!
[insert]: https://docs.julialang.org/en/v1/base/collections/#Base.insert!
[deleteat]: https://docs.julialang.org/en/v1/base/collections/#Base.deleteat!
[length]: https://docs.julialang.org/en/v1/base/collections/#Base.length
