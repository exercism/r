# Arithmetic Operators
add       <- function( a, b ) { return( a  + b ) }
subtract  <- function( a, b ) { return( a  - b ) }
multiply  <- function( a, b ) { return( a  * b ) }
divide    <- function( a, b ) { return( a  / b ) }
remainder <- function( a, b ) { return( a %% b ) }

# Comparison Operators
equals         <- function( a, b ) { return( a == b ) }
isIdentical    <- function( a, b ) { return( identical( a, b ) ) }
notEquals      <- function( a, b ) { return( a != b ) }
notIdentical   <- function( a, b ) { return( ! identical( a, b ) ) }
lessThan       <- function( a, b ) { return( a <  b ) }
lessOrEqual    <- function( a, b ) { return( a <= b ) }
greaterThan    <- function( a, b ) { return( a >  b ) }
greaterOrEqual <- function( a, b ) { return( a >= b ) }

# Logical Operators
logicalAnd <- function( a, b ) { return( a & b ) }
logicalOr  <- function( a, b ) { return( a | b ) }
logicalXor <- function( a, b ) { return( ( a & !b ) | ( !a & b ) ) }
logicalNot <- function( a    ) { return( ! a   ) }
