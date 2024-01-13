# Split-Reverse-Paste

```r
reverse <- function(text) {
  splits <- strsplit(text, "")[[1]]
  reversed <- rev(splits)
  paste(reversed, collapse = "")
}
```

or equivalently:

```r
reverse <- function(text) {
  paste(rev(strsplit(text, "")[[1]]), collapse = "")
}
```

Whether using intermediate variables or nested functions, the same three steps are applied:
1. Convert the string to a vector of characters.
The `strsplit()` fuction returns a `list` (in this case with only one element), so appending `[[1]]` extracts the desired vector.
2. Reverse the vector with `rev()`.
3. Paste the character vector back to a string.
We want no separator between the characters, so include the `collapse = ""` parameter.

This is a simple approach which has worked since early versions of R, and is likely to appear high on internet searches.

Two weaknesses:
- It is relatively slow.
- It will only convert a single input string to an output string.
It fails when applied to vectors with more than one element.
