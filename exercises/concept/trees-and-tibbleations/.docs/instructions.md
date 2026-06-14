# Instructions

A large cherry orchard generally has a small inventory of surplus trees which they would like to offer as lumber.
This helps keep the orchard healthy while providing extra revenue at the same time.
They have asked you to help code up some functionality to help in the tree selection process when a potential customer calls.

~~~~exercism/note
The built-in [`datasets`][ref-datasets] library has many toy datasets, and this exercise uses the `trees` dataset.
To call the dataset, simply use the name `trees`.
```R
library(datasets) # loading is optional

trees |> head(3)
#>    A data.frame: 3 × 3 	
#>   Girth	Height	Volume
#>	 <dbl>	 <dbl>	 <dbl>
#> 1   8.3	    70	  10.3  
#> 2   8.6	    65	  10.3
#> 3   8.8	    63	  10.2
```
Please note the three columns: `Girth`, `Height` and `Volume`

The dataset is initially in the form of a `data.frame`, but you may want to choose to work with it as a `tibble`.

[ref-datasets]: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
~~~~

## 1. Rename a column

Unfortunately there was a clerical error which has never been fixed and one column in the dataset is named `Girth`, but this is really the `Diameter`.

Define a data.frame/tibble called `tree_data` that corrects the name of the `Girth` column in `trees` to `Diameter`.

```R
head(tree_data, 3)
#>     A tibble: 3 × 3 
#> Diameter	 Height	Volume
#>    <dbl>	  <dbl>	 <dbl>
#>      8.3	     70	  10.3
#>      8.6	     65	  10.3
#>      8.8	     63	  10.2
```

## 2. Add girth and weight columns

The girth (aka circumference) is still a useful measurement, and so is the weight of the timber.
The girth is easily calculated by `πD`, where `D` is the diameter.
The weight of all the timber can be calculate by `ρV`, where `ρ = 35` is the density of cherry wood and `V` is the volume of timber.

Define the function `girth_n_weight(data, rnd_digits)` which takes dataframe and numeric arguments.
The function should return a new dataframe with the two additional columns: `Girth` and `Weight` rounded to the appropriate number of digits given by `rnd_digits`.

```R
girth_n_weight(tree_data, 1) |> head(3)
#>           A tibble: 3 × 5 
#> Diameter  Height	 Volume	 Girth	Weight
#>    <dbl>	  <dbl>	  <dbl>	 <dbl>	 <dbl>
#>      8.3	     70	   10.3	  26.1	 360.5
#>      8.6	     65	   10.3	  27.0	 360.5
#>      8.8	     63	   10.2	  27.6	 357.0
```

## 3. Orchard copy of dataset

For each potential customer, the orchard keeps a special copy of the dataset to help with the sale.
This dataset has the most relevant columns, `Height` and `Weight`, moved to the front and is sorted by `Height`.

Define the function `orchard_copy(data, important_cols)` which takes a dataframe as input.
This should return a new dataframe with `Height` and `Weight` moved to the front and the rows sorted by `Height`.

```R
tree_data |> girth_n_weight() |> orchard_copy() |> head(3)
#>            A tibble: 3 × 5 
#> Weight	Height	Diameter	Volume	Girth
#>  <dbl>	 <dbl>	   <dbl>	 <dbl>	<dbl>
#>    357	    63	       9	    10	   28
#>    360	    70	       8	    10	   26
#>    360	    65	       9	    10	   27
```

## 4. Customer copy of dataset

Each potential customer will get a personal version of the dataset based on their preferences.
To this end, the customer may specify: the minimum height, the maximum height and the maximum weight of any single tree.

Define the `customer_copy(data, min_height, max_height, max_weight)` function.
Return a customer copy of the dataframe with `Height`, `Weight`, `Diameter` and `Girth` columns with rows that are within the constraints.

```R
tree_data |> 
    girth_n_weight(1) |> 
    orchard_copy() |>
    customer_copy(65, 75, 1500) |> 
    head(3)
#>        A tibble: 3 × 4 
#> Height	Weight	Diameter	Girth
#>  <dbl>	 <dbl>	   <dbl>	<dbl>
#>     70	 360.5	     8.3	 26.1
#>     65	 360.5	     8.6	 27.0
#>     66	 546.0	    11.0	 34.6
```
