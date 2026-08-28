# Instructions

You have just been hired at a new cab service which is trying to differentiate itself from other offerings in an already saturated market.
To achieve this, the CEO has decided to offer an ultra-luxury service in Manhattan with attendants at every intersection to assist customers before and after their ride.
Now, you need to write some code that will help with the operations of the service.

## 1. Simple Complex Number

Your CEO has decided that since Manhattan has a mainly grid-like street layout, complex numbers are a convenient way to represent the intersections of the streets.
This has positive and negative real numbers representing east and west, and positive and negative imaginary numbers representing north and south, respectively.

Since instantiating a complex number in R is a bit, er... unique, you have been instructed to implement a simple complex number function.

Implement the `simplex(a, b)` function, which takes integers `a` and `b`.
Return the complex number `a+bi`.

```r
simplex(1, 1)
#> 1+1i

simplex(-3, 4)
#> -3+4i
```

## 2. Get Driver Directions

When a customer gives the destination intersection, your drivers will get directions for how to get there.
These directions come in the form of a complex number with the real part representing how many blocks north/south to go and the imaginary part representing the east/west distance.
To align with a canonical compass, your project manager has decided north will be in the positive imaginary direction, and south is in the negative imaginary direction.
Likewise, east is in the positive real direction, and west is in the negative real direction.

Implement the `driver_directions(start, end)` function, which takes the `start`ing intersection coordinates and the `end` destination coordinates.
Return a complex number representing how many blocks east/west + north/south the driver has to go.

```r
driver_directions(0+0i, 7+5i)
#> 7+5i

driver_directions(-2+3i, 4-5i)
#> 6-8i
```

## 3. Get Manhattan Distance

The customer is charged a fee for the distance that the cab has to cover.
Since Manhattan has a grid-like street layout, the taxis can only travel along these routes.
This structure leads to a distance measure constrained to follow the grid lines.
The distance can be found by adding up either the number of lines traversed or the number of intersections reached (i.e. not including the starting intersection).
This measure is commonly called the Manhattan distance or L1 norm.

Implement the `manhattan(start, end)` function, which takes the `start` and `end` intersections.
Return the Manhattan distance between the `start` and `end` intersections.

```r
manhattan(0+0i, 3+4i)
#> 7

manhattan(-2-3i, -1+1i)
#> 5
```

## 4. Get "As the Crow Flies" Distance

The CEO was able to get investment banks onboard by highlighting that the service is not only ultra-luxury but green, because it will use trained crows to ferry messages between the attendants at the intersections (which relay information about the passengers for a personalized experience).
It appears none of the investment bankers bothered to do their due diligence on finding out why exactly this is environmentally friendly, or even what kind of CEO enjoys training crows in their free time, because the investment money has been rolling in.

This service is also charged by distance traveled.
However, since crows can fly, they don't have to follow the grid network of roads and can take the shortest path.
Of course, this might not be the case when there are huge skyscrapers, but the CEO is putting this service in Manhattan, Kansas (aka "The Little Apple"), where the crows can easily fly over the low-rise buildings.
The potential demand for such a service in Manhattan, Kansas, and how the local pedestrians will feel about all these birds flying overhead are matters for another day.

Implement the `as_crow_flies(start, end)` function, which takes the `start` and `end` intersections.
Return the as-the-crow-flies distance between the two.

```r
as_crow_flies(0+0i, 3+4i)
#> 5
```

## 5. Get Crow Directions

Your CEO has trained the crows to follow similar kinds of directions to the drivers.
However, the CEO has a love of the Southern Hemisphere and trained the crows using a different compass from that used by your project manager for the rest of the system.
Your CEO is turning out to be quite an eccentric person.
The CEO's compass has north being in the negative imaginary direction, and south being the positive imaginary direction.
This is the opposite to the drivers' north/south directions, while east/west remain the same.

Implement the `crows_directions(start, end)` function, which takes the `start` and `end` intersections.
Return the complex number analogous to the driver's directions, but with north/south flipped.

```r
driver_directions(0+0i, 7+5i)
#> 7-5i

driver_directions(-2+3i, 4-5i)
#> 6+8i
```
