# Instructions
#
Elyse, magician-to-be, continues her training. She will be given several stacks of cards that she needs to perform her tricks.
To make things a bit easier, she only uses the cards 1 to 10.

In this exercise, use built-in methods to analyse the contents of a vector.

## 1. Determine if a card is present

Elyse wants to determine if a card is present in the stack -- in other words, if the stack contains a specific number.

```R
card = 3;
does_stack_include_card(c(2, 3, 4, 5), card);
# => TRUE
```

## 2. Find the position of a card

Elyse wants to know the position (index) of a card in the stack. 
If the card is not in the stack, return `-1`.

```R
card = 2;
get_card_position(c(9, 7, 3, 2), card);
# => 4
```

## 3. Determine if each card is even

Elyse wants to know if every card is even -- in other words, if each number in the stack is an even number.

```R
is_each_card_even(c(2, 4, 6, 7));
# => FALSE
```

## 4. Check if the stack contains an odd-value card

Elyse wants to know if there is an odd number in the stack.

```R
does_stack_include_odd_card(c(3, 2, 6, 4, 8));
# => TRUE
```

## 5. Get the first odd card from the stack

Elyse wants to know the value of the first card that is odd.  
If there is no odd card in the stack, return `-1`.

```R
get_first_odd_card(c(4, 2, 8, 7, 9));
# => 7
```

## 6. Determine the position of the first card that is even

Elyse wants to know the position of the first card that is even.
If there is no even card in the stack, return `-1`.

```R
get_first_even_card_position(c(5, 2, 3, 1));
# => 2
```