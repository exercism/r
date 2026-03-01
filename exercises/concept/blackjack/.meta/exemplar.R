library(dplyr)

# Old version

# parse_card <- function(card) {
#   switch(card,
#          ace = 11,
#          two = 2,
#          three = 3,
#          four = 4,
#          five = 5,
#          six = 6,
#          seven = 7,
#          eight = 8,
#          nine = 9,
#          ten = ,
#          jack = ,
#          queen = ,
#          king = 10,
#          0
#   )
# }

# first_turn <- function(card1, card2, dealer_card) {
#   hand_score <- parse_card(card1) + parse_card(card2)
#   dealer_score <- parse_card((dealer_card))
#   if (hand_score == 22) {
#     return("P")
#   }
#   if (hand_score == 21) {
#     return(ifelse(dealer_score < 10, "W", "S"))
#   }
#   if (hand_score >= 17 || (hand_score >= 12 && dealer_score < 7)) {
#     return("S")
#   }
#   "H"
# }

parse_card <- function(card) {
  case_match(
    card,
    "ace" ~ 11,
    "two" ~ 2,
    "three" ~ 3,
    "four" ~ 4,
    "five" ~ 5,
    "six" ~ 6,
    "seven" ~ 7,
    "eight" ~ 8,
    "nine" ~ 9,
    c("ten", "jack", "queen", "king") ~ 10,
    .default = 0
  )
}

first_turn <- function(card1, card2, dealer_card) {
  hand_score <- parse_card(card1) + parse_card(card2)
  dealer_score <- parse_card((dealer_card))
  case_when(
    hand_score == 22 ~ "P",
    hand_score == 21 ~ if_else(dealer_score < 10, "W", "S"),
    hand_score >= 17 || (hand_score >= 12 && dealer_score < 7) ~ "S",
    .default = "H"
  )
}
