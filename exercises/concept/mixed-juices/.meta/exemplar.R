time_to_mix_juice <- function(juice) {
  switch(juice,
    "Pure Strawberry Joy" = 0.5,
    "Energizer" = ,
    "Green Garden" = 1.5,
    "Tropical Island" = 3,
    "All or Nothing" = 5,
    2.5
  )
}

wedges_from_lime <- function(size) {
  switch(size,
    "small" = 6,
    "medium" = 8,
    "large" = 10
  )
}

# Implementing limes_to_cut() in a vectorized way is possible
# but I found that all the edge cases make the code quite ugly.
limes_to_cut <- function(needed, limes) {
  limes_cut <- 0
  while (needed > 0 && length(limes) > 0) {
    needed <- needed - wedges_from_lime(limes[1])
    limes <- limes[-1]
    limes_cut <- limes_cut + 1
  }
  limes_cut
}

order_times <- function(orders) {
  for (order in orders) {
    print(time_to_mix_juice(order))
  }
}

remaining_orders <- function(time_left, orders) {
  while (time_left > 0 && length(orders) > 0) {
    time_left <- time_left - time_to_mix_juice(orders[1])
    orders <- orders[-1]
  }
  orders
}
