# Introduction

R has no separate [Set][wiki-set] type, instead using a variety of functions to perform similar operations on vectors.

The [`%in%`][ref-match] operator tests for set membership.
This infix operator is a synonym for the function `is.element()`.

```R
2 %in% 1:10 # TRUE
12 %in% 1:10 # FALSE
```

Relevant functions include:

- [`unique()`][ref-unique] to remove duplicates.
- [`union()`][ref-sets] to combine sets (mathematically, `A ∪ B`).
- [`intersect()`][ref-sets] to find elements common to both sets (`A ∩ B`).
- [`setdiff()`][ref-sets] to subtract one set from another (`A - B`).
- [`setequal`][ref-sets] to test set equality, ignoring duplicates and ordering.

```R
> set_1 <- c("a", "b", "c", "b", "a")
> unique(set_1) # deduplicate
[1] "a" "b" "c"

> set_2 <- c('a', "c", "d")
> union(set_1, set_2) # values in either set
[1] "a" "b" "c" "d"

> intersect(set_1, set_2) # values in both sets
[1] "a" "c"

> setdiff(set_1, set_2) # values in set_1 but not set_2
[1] "b"

> setdiff(set_2, set_1) # values in set_2 but not set_1
[1] "d"

setequal(set_1, c("c", "b", "a", "b")) # are elements the same after deduplication?
[1] TRUE
```

## Hash tables

The vector operations described above are part of core R.
These are useful for small problems but become slow for large sets.

Various third-party packages implement [hash tables][wiki-hash], to improve performance in some contexts.

For example, the [`hashtable`][ref-hashtable] package provides implementations of `hashmap` and `hashset`, which scale better.
Like most external packages, this is not available within Exercism, but is worth investigating for real-world problems.

[wiki-set]: https://en.wikipedia.org/wiki/Set_(abstract_data_type)
[wiki-hash]: https://en.wikipedia.org/wiki/Hash_table
[ref-match]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/match.html
[ref-unique]: https://www.rdocumentation.org/packages/base/versions/3.3.0/topics/unique
[ref-sets]: https://www.rdocumentation.org/packages/base/versions/3.3/topics/sets
[ref-hashtable]: https://www.rdocumentation.org/packages/r2r/versions/0.1.1/topics/hashtable
