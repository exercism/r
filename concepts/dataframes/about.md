# About

In other parts of the syllabus, we have seen various data types with different characteristics.

- Atomic [vectors][concept-vectors] are 1-dimensional and homogenous in type.
- [Lists][concept-lists] are 1-dimensional and elements can be of heterogenous types.
- [Matrices and arrays][concept-matrices-arrays] are multi-dimensional and homogeneous.

This Concept will look at ways to store multi-dimensional, heterogenous data.
In practice, _most_ real-world data is like this, so we are now getting to the heart of how R is (mostly) used in practice.

## Dataframe variants

Over the decades, R has added multiple data types to handle tabular data.

This syllabus will focus mainly on tibbles, but it is useful to know about some alternatives.

### The `data.table`

The [`data.table`][ref-data-table] is an attempt to improve on the `data.frame`, in a third-party package.

Tibbles and data.tables are both well-respected, and there is inevitably much argument about which is "better".
Maybe there is some degree of consensus around the following points (_even if they will be criticized as simplistic_).

- `tibble` is optimized mainly for ease of use, and integration with the Tidyverse ecosystem.
- `data.table` is optimized mainly for raw power and scalability, especially when working with very large datasets.

In any case, `data.table` is not available within Exercism, so it is mentioned here just for completeness.

### The `data.frame`

In Base R, a [`data.frame`][web-dataframe] is a `list` of equal-length `vectors`.
This can be thought of as a rectangular table of data, in which each column is homogeneous, but each row can (and usually does) contain different types of data.

An example to illustrate this:

```R
# create the column vectors
languages <- c("Fortran", "R", "Python", "Julia")
created <- c(1957, 1993, 1991, 2012)
has.syllabus <- c(FALSE, TRUE, TRUE, TRUE)

# join columns to create the dataframe
df <- data.frame(languages, created, has.syllabus)
df
#>   languages created has.syllabus
#> 1   Fortran    1957        FALSE
#> 2         R    1993         TRUE
#> 3    Python    1991         TRUE
#> 4     Julia    2012         TRUE

# look at the structure
str(df)
#> 'data.frame':	4 obs. of  3 variables:
 #> $ languages   : chr  "Fortran" "R" "Python" "Julia"
 #> $ created     : num  1957 1993 1991 2012
 #> $ has.syllabus: logi  FALSE TRUE TRUE TRUE
 ```

 We have a column of character strings, a column of numbers and a column of booleans.
 When scaled up, this is an intuitive way to represent many collections of real world data.

### The `tibble`

The `data.frame` design is _old_.

Multi-decade experience, plus changing patterns of how R is used, led to a redesign, creating a modernized alternative in the Tidyverse: [tibbles][web-tibble].

Compared to Base R, tibbles have:

- Different defaults, to reduce common problems.
- Less willingness to coerce data types during input.
- More and clearer error messages.
- Different, usually better, display formats.

In short, a `tibble` aims to "_do less and complain more_", also described as "_lazy and surly_".

The types are usually interchangeable: any function which accepts a `data.frame` will also accept a `tibble`, and _vice versa_.

Conversions between the types are easy, with [`as_tibble(df)`][ref-as_tibble] and [`as.data.frame(tbl)`][ref-asdataframe].

For new work, using tibbles will probably help you create more robust code.
However, legacy code and legacy data is very plentiful in the R world, so the `data.frame` is likely to remain common for a long time.

```R
# column vectors are same as for data.frame
library(tibble)
tbl <- tibble(languages, created, has.syllabus)
tbl
  # A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE      
  
str(tbl)
#> tibble [4 × 3] (S3: tbl_df/tbl/data.frame)
#>  $ languages   : chr [1:4] "Fortran" "R" "Python" "Julia"
#>  $ created     : num [1:4] 1957 1993 1991 2012
#>  $ has.syllabus: logi [1:4] FALSE TRUE TRUE TRUE
```

Note the default print format: the comment line with dimensions is printed automatically, and column types are also displayed.

## Working with tibbles

Tibbles are a core part of the Tidyverse, so add them with either `library(tibble)` or `library(tidyverse)`.

Documentation is fairly extensive, in the Tidyverse style:

- A [website][web-tibble].
- A [function reference][ref-tibbles].
- A [chapter][book-tibble] in R for Data Science.

### Creating a tibble

Most simply, we can use the [`tibble()`][ref-tibble] function to join column vectors, as for `data.frame()`.
An example of this was shown in a previous section.

If it is more convenient to enter values row-wise, the corresponding function is [`tribble()`][ref-tribble].

```R
tbl_r <- tribble(
  # column names marked with tilde prefix
  ~languages, ~created, ~has.syllabus,
  "Fortran", 1957, FALSE,
  "R", 1993, TRUE,
  "Python", 1991, TRUE,
  "Julia", 2012, TRUE
)

tbl_r
# A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE    
```

In practice, there are dozens of ways to create tibbles, as they are the default output format from a diverse range of Tidyverse functions.
We will return to this in a future Concept.

## Manipulating a tibble

The [Functional Programming][concept-funcprog] Concept discussed the [`purrr`][web-purrr] library to manipulate vectors and lists (1-D data structures).

For dataframes (whether traditional or tibbles), the corresponding library to use is [`dplyr`][web-dplyr].

We introduced `dplyr` previously, in the [Switch Concept][concept-switch].
That just used a few utility functions, but now we can start to explore the rest of this large library.

### Subsetting

Dataframes, including tibbles, can be treated as lists of column vectors, so list indexing recovers a specified column.

```R
tbl
# A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       T ar
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE    

tbl$created
#> [1] 1957 1993 1991 2012
```

A dataframe can also be indexed with [matrix-style][concept-matrices-arrays] indexing.

```R
tbl[c(2, 4), 1:2]
  # A tibble: 2 × 2
#>   languages created
#>   <chr>       <dbl>
#> 1 R            1993
#> 2 Julia        2012
```

In modern R with the Tidyverse ecosystem, [`dplyr`][web-dplyr] functions are generally more flexible and convenient, and will be the focus for the rest of this Concept.

### Column-wise operations

Get a single column with [`pull()`][ref-pull] with the name or sequential number (negative numbers to count right-to-left).

```R
tbl |> pull(created)
#> [1] 1957 1993 1991 2012
```

This is the same result as `tbl$created`, but using a pipeline-friendly function.

To get multiple columns, the appropriate function is [`select()`][ref-select], which is highly versatile.
Get (or drop) columns based on properties of their name or type.

```R
# Range with position and/or name
tbl |> select(1:created)
  # A tibble: 4 × 2
#>   languages created
#>   <chr>       <dbl>
#> 1 Fortran      1957
#> 2 R            1993
#> 3 Python       1991
#> 4 Julia        2012

# Exclude a column
tbl |> select(!created)
  # A tibble: 4 × 2
#>   languages has.syllabus
#>   <chr>     <lgl>       
#> 1 Fortran   FALSE       
#> 2 R         TRUE        
#> 3 Python    TRUE        
#> 4 Julia     TRUE        

# Use type of column
tbl |> select(where(is.numeric))
  # A tibble: 4 × 1
#>   created
#>     <dbl>
#> 1    1957
#> 2    1993
#> 3    1991
#> 4    2012
```

Multiple criteria are allowed, using Boolean operators `&`, `|` and `!` (and, or not).

Column names that are _valid R identifiers_ do not need quotes within a [`select()`][ref-select].
Invalid names (e.g. those including spaces) can be enclosed in backticks, though renaming them might be better.

The [`select()`][ref-select] function can work with a range of helper functions to pick column names: [`starts_with`][ref-starts_with], [`contains`][ref-starts_with], [`num_range`][ref-starts_with] and various others.
[`matches`][ref-starts_with] allows full [RegEx][concept-regex] matching.
See the [documentation][ref-select] for details.

Such power seems quite silly with our toy dataframe of languages.
Fortunately, the [`starwars`][ref-starwars] tibble is included in `dplyr`, giving us something bigger to practice with.

```R
# limit display to top 3 rows of non-list columns
starwars |> 
  select(!where(is.list)) |> 
  head(3)
  # A tibble: 3 × 11
#>   name           height  mass hair_color skin_color  eye_color birth_year sex   gender    homeworld species
#>   <chr>           <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>     <chr>     <chr>  
#> 1 Luke Skywalker    172    77 blond      fair        blue              19 male  masculine Tatooine  Human  
#> 2 C-3PO             167    75 NA         gold        yellow           112 none  masculine Tatooine  Droid  
#> 3 R2-D2              96    32 NA         white, blue red               33 none  masculine Naboo     Droid  

# pick a subset of columns
starwars |> 
  select(name | ends_with("color")) |> 
  head(5)
  # A tibble: 5 × 4
#>   name           hair_color skin_color  eye_color
#>   <chr>          <chr>      <chr>       <chr>    
#> 1 Luke Skywalker blond      fair        blue     
#> 2 C-3PO          NA         gold        yellow   
#> 3 R2-D2          NA         white, blue red      
#> 4 Darth Vader    none       white       yellow   
#> 5 Leia Organa    brown      light       brown    
```

### Row-wise operations

~~~~exercism/note
Clearly, `dplyr` provides powerful ways to select columns by name.

Can we do similar things with row names?

_No!_
Traditional R dataframes can have row names, but (after a history of bugs and performance issues) row names are _not allowed_ in `tibbles`.

If you want names, put them in a `<chr>` column (typically column 1), used like any other column.
Import functions such as [`as_tibble()`][ref-as_tibble] will create this automatically when importing data with named rows.

If this row-name limitation seems oddly restrictive, remember that most large database systems handle tables the same way: Oracle, SQL Server, PostgreSQL, MySQL...

[ref-as_tibble]: https://tibble.tidyverse.org/reference/as_tibble.html
~~~~

Get rows matching some criteria with [`filter()`][ref-filter], or exclude them with `filter_out()`.

```R
starwars |> 
  select(name:mass) |> 
  filter(between(height, 150, 165) & !is.na(mass))
  # A tibble: 4 × 3
#>   name               height  mass
#>   <chr>               <int> <dbl>
#> 1 Leia Organa           150    49
#> 2 Beru Whitesun Lars    165    75
#> 3 Nien Nunb             160    68
#> 4 Ben Quadinaros        163    65
```

Filter criteria can be arbitrarily complex, but always based on row _contents_.

If row _numbers_ are known, we can use a variety of [`slice()`][ref-slice] functions.

```R
starwars |> 
  select(name | homeworld) |> 
  slice(20:25)
  # A tibble: 6 × 2
#>   name             homeworld
#>   <chr>            <chr>    
#> 1 Palpatine        Naboo    
#> 2 Boba Fett        Kamino   
#> 3 IG-88            NA       
#> 4 Bossk            Trandosha
#> 5 Lando Calrissian Socorro  
#> 6 Lobot            Bespin   

# random sample of rows
starwars |> 
  select(name | homeworld) |> 
  slice_sample(n = 4)
  # A tibble: 4 × 2
#>   name            homeworld
#>   <chr>           <chr>    
#> 1 Shaak Ti        Shili    
#> 2 Luminara Unduli Mirial   
#> 3 Grievous        Kalee    
#> 4 Palpatine       Naboo    
```

To remove duplicate rows, use [`distinct()`][ref-distinct].

## Modifying a tibble

First caveat: the [_copy-on-modify_][concept-functions] default means that the original tibble usually remains unchanged.

Most modifications are applied column-wise.

Column names can be changed with [`rename(newname = oldname)`][ref-rename], or `rename_with()` to apply a function.
A typical use would be cleaning up imported names to make them easier to work with in R, by removing whitespace and forcing a consistent format for related names.

Note the syntax within `rename()`.
The _contents_ of column `oldname` are _bound_ to name `newname`, hence the order.

Column order can be changed with [`relocate()`][ref-relocate].
Specified column(s) are moved to the left-most position(s) by default, but a `.before` or `.after` argument can be used for finer positioning.

```R
sw <- starwars |> select(name:species) |> slice(1:4)
sw
  # A tibble: 4 × 11
#>   name           height  mass hair_color skin_color  eye_color birth_year sex   gender    homeworld species
#>   <chr>           <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>     <chr>     <chr>  
#> 1 Luke Skywalker    172    77 blond      fair        blue            19   male  masculine Tatooine  Human  
#> 2 C-3PO             167    75 NA         gold        yellow         112   none  masculine Tatooine  Droid  
#> 3 R2-D2              96    32 NA         white, blue red             33   none  masculine Naboo     Droid  
#> 4 Darth Vader       202   136 none       white       yellow          41.9 male  masculine Tatooine  Human  

sw |> relocate(c(species, homeworld), .after = name)
  # A tibble: 4 × 11
#>   name           species homeworld height  mass hair_color skin_color  eye_color birth_year sex   gender   
#>   <chr>          <chr>   <chr>      <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>    
#> 1 Luke Skywalker Human   Tatooine     172    77 blond      fair        blue            19   male  masculine
#> 2 C-3PO          Droid   Tatooine     167    75 NA         gold        yellow         112   none  masculine
#> 3 R2-D2          Droid   Naboo         96    32 NA         white, blue red             33   none  masculine
#> 4 Darth Vader    Human   Tatooine     202   136 none       white       yellow          41.9 male  masculine
```

For bigger changes, [`mutate()`][ref-mutate] lets you:

- Create new columns that are functions of existing columns.
- Replace an existing column, by creating a new column with the same name.
- Delete a column, by setting its value to [`NULL`][concept-nothingness]

Clearly, `mutate()` is powerful, potentially confusing, and a reason to be very grateful for copy-on-modify.

There is no obvious reason to care about the [Body Mass Index][wiki-bmi] of Star Wars characters, but just in case:

```R
starwars |> 
  select(c(name, species, height, mass)) |> 
  mutate(BMI = mass / (height / 100)^2) |> 
  head(4)
  # A tibble: 4 × 5
#>   name           species height  mass   BMI
#>   <chr>          <chr>    <int> <dbl> <dbl>
#> 1 Luke Skywalker Human      172    77  26.0
#> 2 C-3PO          Droid      167    75  26.9
#> 3 R2-D2          Droid       96    32  34.7
#> 4 Darth Vader    Human      202   136  33.3
```

Row-wise operations are less common for modifying single tibbles (merging multiple tibbles will be discussed in a later concept).

One exception: [`arrange()`][ref-arrange] sorts rows by the values in one or more columns.

```R
tbl
  # A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE  

tbl |> arrange(languages)
  # A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 Julia        2012 TRUE        
#> 3 Python       1991 TRUE        
#> 4 R            1993 TRUE     
```

## Summary

Dataframes, whether traditional or tibbles, are central to the way modern R is typically used.

Most of the Tidyverse functions (not just `dplyr`) take tibbles as input and/or create them as output.

This concept just provided a brief introduction, barely scratching the surface of what is possible.

Later concepts will discuss several other aspects of dataframes (_within the technical contraints of Exercism_).

[web-dataframe]: https://bioinformatics.ccr.cancer.gov/docs/rintro/Lesson_3/
[web-tibble]: https://tibble.tidyverse.org/
[ref-tibbles]: https://tibble.tidyverse.org/reference/index.html
[book-tibble]: https://r4ds.had.co.nz/tibbles.html
[ref-data-table]: https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
[ref-tibble]: https://tibble.tidyverse.org/reference/tibble.html
[ref-tribble]: https://tibble.tidyverse.org/reference/tribble.html
[web-purrr]: https://purrr.tidyverse.org/index.html
[web-dplyr]: https://dplyr.tidyverse.org/index.html
[ref-as_tibble]: https://tibble.tidyverse.org/reference/as_tibble.html
[ref-asdataframe]: https://www.rdocumentation.org/packages/base/versions/3.1.1/topics/as.data.frame
[ref-pull]: https://dplyr.tidyverse.org/reference/pull.html
[ref-select]: https://dplyr.tidyverse.org/reference/select.html
[ref-relocate]: https://dplyr.tidyverse.org/reference/relocate.html
[ref-starts_with]: https://tidyselect.r-lib.org/reference/starts_with.html
[ref-starwars]: https://dplyr.tidyverse.org/reference/starwars.html
[ref-filter]: https://dplyr.tidyverse.org/reference/filter.html
[ref-slice]: https://dplyr.tidyverse.org/reference/slice.html
[ref-mutate]: https://dplyr.tidyverse.org/reference/mutate.html
[ref-distinct]: https://dplyr.tidyverse.org/reference/distinct.html
[ref-rename]: https://dplyr.tidyverse.org/reference/rename.html
[ref-arrange]: https://dplyr.tidyverse.org/reference/arrange.html
[concept-vectors]: https://exercism.org/tracks/r/concepts/vectors
[concept-lists]: https://exercism.org/tracks/r/concepts/lists
[concept-switch]: https://exercism.org/tracks/r/concepts/switch
[concept-funcprog]: https://exercism.org/tracks/r/concepts/functional-programming
[concept-matrices-arrays]: https://exercism.org/tracks/r/concepts/matrices-arrays
[concept-functions]: https://exercism.org/tracks/r/concepts/functions
[concept-regex]: https://exercism.org/tracks/r/concepts/regular-expressions
[concept-nothingness]: https://exercism.org/tracks/r/concepts/nothingness
[wiki-bmi]: https://en.wikipedia.org/wiki/Body_mass_index
