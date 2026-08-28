# Instructions

You have just gotten a job at a new cab service which is trying to differentiate itself from other offerings in an already saturated market.
To achieve this, the CEO has decided to offer an ultra-luxury service in Manhattan with attendants at every corner to assist customers before and after their ride.
Now, you need to write some code that will help with the operations of the service.

## 1. Simple Complex Number

Your boss has decided that since Manhattan has a fairly grid-like street layout, complex numbers are a convenient way to represent an intersection.
This has positive and negative real numbers representing east and west, and positive and negative imaginary numbers representing north and south.

Since instantiating a complex number in R is a bit, er... unique, you have been instructed to implement a simple complex number function.

Implement the `simplex(a, b)` function, which takes integers `a` and `b`.
Return the complex number `a + bi`.

```r
simplex(1, 1)
#> 1+1i

simplex(-3, 4)
#> -3+4i
```

## 2. Get Driver Directions

When a customer gives the destination corner, your drivers will get directions for how to get there.
These directions come in the form of a complex number with the real part representing how many blocks north/south to go and the imaginary part east/west.
North is in the positive imaginary direction, and south is in the negative imaginary direction.
East is in the positive real direction, and west is in the negative real direction.

Implement the `driver_directions(start, end)` function, which takes the starting intersection coordinates and the destination coordinates.
Return a complex number representing how many blocks north/sout and east/west the driver has to go.

```r
driver_directions(0+0i, 7+5i)
#> 7+5i

driver_directions(-2+3i, 4-5i)
#> 6-8i
```

## 3. Get Manhattan Distance

The customer is charged a fee for the distance that the taxi has to cover.
Since Manhattan has a grid-like street layout, the taxis can only travel along these routes.

Implement the `manhattan(start, end)` function, which takes the `start` and `end` intersections.
Returns the Manhattan (i.e. L1) distance between the `start` and `end` intersections.

```r
manhattan(0+0i, 3+4i)
#> 7

manhattan(-2-3i, -1+1i)
#> 5
```

## 4. Get "As the Crow Flies" Distance

The CEO was able to get investment banks onboard by highlighting that the service was not only ultra-luxury, but it was green, because it would use trained crows to ferry messages between the attendants at the intersections about the passengers details for further personalization.
It appears none of the bankers did their due diligence to find out why exactly this is environmentally friendly, or what kind of CEO enjoys training crows in their free time, because investment money has been rolling in.

This service is also charged by distance traveled.
However, since crows can fly, they don't have to follow the grid network of roads and can take the shortest path.
Of course, this still might not be the case in Manhattan, New York City, because of the sky scrappers, but the CEO is putting this service in Manhattan, Kansas (aka "The Little Apple"), where the crows can easily fly over the buildings.
The potential demand for such a service in Manhattan, Kansas and how the local pedestrians will feel about all these birds flying over head are matters for another day.

Implement the `as_crow_flies(start, end)` function, which takes the `start` and `end` intersections.
Return the Euclidean distance between the two.

```r
as_crow_flies(0+0i, 3+4i)
#> 5
```

## 5. Get Crow Directions

Your CEO has trained the crows to follow similar kinds of directions to the drivers.
However, the CEO is from South America, and has always felt that south is "up", so the crows have been trained with their north being in the negative imaginary direction, and south being the positive imaginary direction, opposite to the drivers north/south directions.
Your CEO is quite an eccentric person.

Implement the `crows_directions(start, end)` function, which takes the `start` and `end` intersections.
Return the complex number analogous to the driver's directions, but with north/south flipped.

```r
driver_directions(0+0i, 7+5i)
#> 7-5i

driver_directions(-2+3i, 4-5i)
#> 6+8i
```
