# About

By this point in the syllabus, you have seen R used often as an imperative language, and increasingly as a functional language (especially with the [`purrr`][ref-purrr] and [`dplyr`][ref-dplyr] libraries).

Suggesting now that R is primarily object-oriented may provoke some skepticism!

Oddly, this is a true statement.
Internally, R is implemented using classes, inheritance, polymorphism, and the sort of attitudes typical of OOP programmers.

However, anyone familiar with Java or Ruby (explicitly OOP) or even Python (semi-covertly OOP, in some respects) will find the R approach ... _unfamiliar_.

For a start, there are multiple class designs: perhaps three in common use (S3, S4, R6), plus various others of mainly theoretical interest.

A thorough discussion can be found in [Advanced R, 2e][book-advanced-r], chapters 12-16.
This 2019 book is aimed largely at people who want to understand and maintain the internals of R, so OOP is essential.

More end-user-oriented textbooks vary.

- The Art of R Programming (2011, print-only) has an OOP chapter covering S3 and (more briefly) S4, which were important at that time.
  The comment that _"S3 classes have a rather cobbled-together structure"_ is still strikingly true.
- R in Action (3e, 2022) relegates OOP to 3 pages in a chapter on Advanced Programming near the end.
- [R for Data Science, 2e][book-r-data-sci] (2023, with 548 pages in the print edition) makes no mention of OOP.

This Concept will concentrate on S3 classes, which are the simplest, most common and most relevant to Exercism-type problems.
Some of the Practice exercises on the R track require you to create an S3 class, others make this optional but gently encouraged.

## S3 classes

These are old: the S3 name just means they were introduced in version 3 of the S language (a commercial precursor of R).

An S3 class is also very simple: typically, a [List][concept-lists] with at least one extra attribute.

Quoting [Advanced R][book-s3]: _"S3 is informal and ad hoc, but there is a certain elegance in its minimalism: you can’t take away any part of it and still have a useful OO system."_

```R
# create a list
pt2d <- list(x = 2.5, y = 4.2)
str(pt2d)
#> List of 2
#>  $ x: num 2.5
#>  $ y: num 4.2
class(pt2d)
#> [1] "list"
attributes(pt2d)
#> $names
#> [1] "x" "y"

# convert the list to an S3 class
class(pt2d) <- "point2d"
str(pt2d)
#> List of 2
#>  $ x: num 2.5
#>  $ y: num 4.2
#>  - attr(*, "class")= chr "point2d"
class(pt2d)
#> [1] "point2d"
attributes(pt2d)
#> $names
#> [1] "x" "y"

#> $class
#> [1] "point2d"
```

So [`class()`][ref-class] just adds one attribute, in this case identifying `pt2d` as an instance of the `point2d` class.

The creation steps can be combined with [`structure()`][ref-structure]:

```R
pt2d_2 <- structure(list(x = 2.5, y = 4.2), class = "point2d")
pt2d_2 == pt2d
#> Error in pt2d_2 == pt2d : comparison of these types is not implemented
```

Though the resulting instances are notionally identical, we have not yet implemented a way for R to confirm this.

### Generic methods

Anyone familiar with OOP in other languages might be wondering: _"aren't classes supposed to be able to DO things?"_

We can check the methods available for `point2d` instances, and discover that (in contrast to the underlying `list`) there are currently none.

```R
methods(class = "point2d")
#> no methods found
methods(class = "list")
#>  [1] %within%      all.equal     as.col_spec   as.data.frame as_mapper     as_tibble     coerce        common_by    
#>  [9] Ops           pattern_alpha relist        scale_type    select        type.convert  within       
#> see '?methods' for accessing help and source code
```

In most OOP languages, methods are defined within the class definition.
A few languages (notably Ruby) let you add and modify class methods later.

S3 classes are very different.
Instead of adding methods to a class, we add the class to a generic method.

Anyone working interatively at the R console uses generic methods all the time, usually without thinking about how they are implemented.

A very common example is `print()`, even though you rarely type the function name.
Entering a value `x` by itself at the console prompt is just syntactic sugar for `print(x)`.

```R
1:4
#> [1] 1 2 3 4
print(1:4)
#> [1] 1 2 3 4
```

We can already print `pt2d`.
Though `print()` knows nothing about the `point2d` class, it has sensible defaults to handle a wide variety of objects.

```R
pt2d
#> $x
#> [1] 2.5

#> $y
#> [1] 4.2

attr(,"class")
#> [1] "point2d"
```

That is quite verbose, and we might want a way to pretty-print the point concisely.

Easy: just add a function called `print.point2d()`.
The name must be in the form `methodname.classname`, so that the dispatcher knows what to look for.

```R
print.point2d <- function(pt) {
  cat("Cartesian coords (", pt$x, ", ", pt$y, ")\n", sep="")
}

pt2d
#> Cartesian coords (2.5, 4.2)
```

Now suppose we want to create a new generic method, for example `flipvert()` to invert the signe on the `y` coordinate.

Again, easy:

```R
flipvert <- function(x, ...) UseMethod("flipvert")
```

This creates a dispatcher, where `x` is our object with an S3 class, and `...` handles any extra arguments that method definitions may need ("dot args", as described in the [Functions Concept][concept-functions]).

We can then define the method for `point2d` and use it.

```R
flipvert.point2d <- function(pt) {
  pt$y <- -pt$y
  pt
}

flipvert(pt2d)
#> Cartesian coords (2.5, -4.2)

methods("flipvert")
#> [1] flipvert.point2d
```

R now knows how to flip our point and how to display the result.

We could expand this by creating classes for 3D, for polar coordinates, etc, then define methods for each.

From the end-user perspective, there is only `flipvert(x, ...)`, and we can rely on R to determine the input class and use the appropriate underlying implementation.

~~~~exercism/caution
Function names in the format `verb.class` look like S3 methods, both to users and to the R parser.
Please avoid using similar naming in other contexts.

Admittedly, base R sometimes violates this rule.
We should regard this as an unfortunate historical accident (for functions even older than S3), which must be preserved for backwards compatibility.
~~~~

### Inheritance

OOP enthusiasts can write multiple long textbook chapters on inheritance, subclassing, mixins, and all the rest.

R just lets you supply multiple names to the `class` attribute.

At the risk of stretching the example to breaking point, suppose we had made a generic `point` class, and wanted to subclass it to `point2d`, `point3d`, etc.

Then the `point2d` definition simply uses `class = c("point2d", "point")`: the specific class and the parent class (or classes).

Generic methods such as `print()` will then search in sequence for `print.point2d()`, `print.point()` and (probably) `print.default()`, using the first implementation that the dispatcher finds.

### Safety

Many OOP languages (Java, C#, etc) take advantage of data encapsulation within classes to perform careful compile-time checks and enforce type safety.

Please be aware that S3 lets you do pretty much whatever you like, even if it makes no sense (any error message comes later, if at all).

Quoting ["Advanced R"][book-s3] (2e, section 13.3):

> _If you’ve used other OO languages, this might make you feel queasy, but in practice this flexibility causes few problems. R doesn’t stop you from shooting yourself in the foot, but as long as you don’t aim the gun at your toes and pull the trigger, you won’t have a problem._

Well, _okay?_
R is superb for exploratory data science and statistics, often when working interactively.
Nobody is suggesting you should use it to write highly-secure corporate finance systems!

[book-advanced-r]: https://adv-r.hadley.nz/oo.html
[book-r-data-sci]: https://r4ds.hadley.nz/
[book-s3]: https://adv-r.hadley.nz/s3.html
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[ref-purrr]: https://purrr.tidyverse.org/index.html
[ref-dplyr]: https://dplyr.tidyverse.org/index.html
[ref-class]: https://stat.ethz.ch/R-manual/R-devel/library/base/html/class.html
[ref-structure]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/structure
[concept-functions]: https://exercism.org/tracks/r/concepts/functions
