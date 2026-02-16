# Instructions

In this exercise you'll be organizing races between various types of remote controlled cars.
Each car has its own speed and battery drain characteristics.

Cars start with full (100%) batteries. Each time you drive the car using the remote control,
it covers the car's speed in meters and decreases the remaining battery percentage by its battery drain.

If a car's battery is below its battery drain percentage, you can't drive the car anymore.

Each race track has its own distance. Cars are tested by checking if they can finish the track without running out of battery.

## 1. Create a remote controlled car

Define a `car` list with the following elements:

- speed
- battery_drain
- battery
- distance

Allow creating a remote controlled car by defining a function `new_car` that takes the speed of the car in meters,
and the battery drain percentage as its two parameters and returns a `car` list.

For a new car, the battery is at 100% and the distance is zero.

```R
speed <- 5
battery_drain <- 2
car <- new_car(speed, battery_drain)
str(car)
#> List of 4
#>  $ speed        : num 5
#>  $ battery_drain: num 2
#>  $ battery      : num 100
#>  $ distance     : num 0
```

## 2. Create a race track

Define another list called `track` with the single element `length`.
Allow creating a race track by defining a function `new_track` that takes the track's distance in meters:

```R
length <- 800
track <- new_track(length)
str(track)
#> List of 1
#>  $ length: num 800
```

## 3. Check for a drained battery

Implement the `battery_drained()` function that indicates if the battery is drained.
A battery is considered drained is there is not enough to move one more time.

```R
speed = 5;
battery_drain = 2;
car = new_car(speed, battery_drain);
car = drive(car);

battery_drained(car);
#> [1] FALSE
```

## 4. Drive the car

Implement the `drive` function that updates the number of meters driven based on the car's speed, and reduces the battery according to the battery drainage.
If there is not enough battery to drive one more time the car will not move.

```R
speed <- 5
battery_drain <- 2
car <- new_car(speed, battery_drain)
car <- drive(car)
str(car)
#> List of 4
#>  $ speed        : num 5
#>  $ battery_drain: num 2
#>  $ battery      : num 98
#>  $ distance     : num 5
```

## 5. Check if a remote controlled car can finish a race

To finish a race, a car has to be able to drive the race's distance. This means not draining its battery before having crossed the finish line. 

Implement the `can_finish` function that takes a `car` and a `track` as its parameter and returns `TRUE` if the car can finish the race; otherwise, return `FALSE`.

Assume that you are currently at the starting line of the race and start the engine of the car for the race. Take into account that the car's battery might not necessarily be fully charged when starting the race.

```R
speed <- 5
battery_drain <- 5
car <- new_car(speed, battery_drain)

name <- "track1"
length <- 100
track <- new_track(length)

can_finish(car, track)
#> [1] TRUE

# partial battery charge
car$battery <- 50
can_finish(car, track)
#> [1] FALSE
```

## 6. Store whether the car can finish a track on a full battery

You have created several tracks of different lengths, and need to store whether your car can complete them if fully charged.

Implement the `store_track` function which takes a car, a track and a track name, and returns an updated car with an extra element.
This element should have the `name` of the track, and the value should be a sub-list with the `length` and whether the car can `complete` it.

The car supplied in the argument may not be fully charged, so be sure to reset the battery and the distance travelled before using it.

```R
speed <- 5
battery_drain <- 5
car <- new_car(speed, battery_drain)
car$battery <- 50

name <- "track1"
length <- 100
track <- new_track(length)

track1 <- store_track(car, track, "Imola")
str(track1)
#> List of 5
#>  $ speed        : num 5
#>  $ battery_drain: num 5
#>  $ battery      : num 100
#>  $ distance     : num 0
#>  $ Imola        :List of 2
#>   ..$ length  : num 100
#>   ..$ complete: logi TRUE
```
