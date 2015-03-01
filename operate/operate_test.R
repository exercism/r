test.hello.world <- function() {
  
  # default filename is example.R
  filename <- "example.R"
  
  # check for hello-world.R
  if (file.exists("operate.R")) filename <- "operate.R"
  
  # load the code to be tested
  source(filename)
  
  # test Arithmetic Operators
  checkEquals( add(   2,   2 ),   4 )
  checkEquals( add(   7,   3 ),  10 )
  checkEquals( add( 123, 456 ), 579 )

  checkEquals( subtract(   2,   2 ),    0 )
  checkEquals( subtract(   7,   3 ),    4 )
  checkEquals( subtract( 123, 456 ), -333 )

  checkEquals( multiply(   2,   2 ),     4 )
  checkEquals( multiply(   7,   3 ),    21 )
  checkEquals( multiply( 123, 456 ), 56088 )

  checkEquals( divide(   2,   2 ),       1 )
  checkEquals( divide(   7,   3 ),     7/3 )
  checkEquals( divide( 123, 456 ), 123/456 )

  checkEquals( remainder(   2,   2 ),   0 )
  checkEquals( remainder(   7,   3 ),   1 )
  checkEquals( remainder( 123, 456 ), 123 )
  
  # test Comparison Operators
  checkTrue(   equals(    3 ,      3  ) )
  checkTrue(   equals(    3 ,     '3' ) )
  checkTrue(   equals( 'Bob',   'Bob' ) )
  checkTrue( ! equals(    3 ,      4  ) )
  checkTrue( ! equals(    3 , 'three' ) )

  checkTrue(   isIdentical(    3 ,      3  ) )
  checkTrue( ! isIdentical(    3 ,     '3' ) )
  checkTrue(   isIdentical( 'Bob',   'Bob' ) )
  checkTrue( ! isIdentical(    3 ,      4  ) )
  checkTrue( ! isIdentical(    3 , 'three' ) )

  checkTrue( ! notEquals(    3 ,      3  ) )
  checkTrue( ! notEquals(    3 ,     '3' ) )
  checkTrue( ! notEquals( 'Bob',   'Bob' ) )
  checkTrue(   notEquals(    3 ,      4  ) )
  checkTrue(   notEquals(    3 , 'three' ) )

  checkTrue( ! notIdentical(    3 ,      3  ) )
  checkTrue(   notIdentical(    3 ,     '3' ) )
  checkTrue( ! notIdentical( 'Bob',   'Bob' ) )
  checkTrue(   notIdentical(    3 ,      4  ) )
  checkTrue(   notIdentical(    3 , 'three' ) )
  
  checkTrue( ! lessThan(  3 ,  3  ) )
  checkTrue(   lessThan(  3 ,  4  ) )
  checkTrue( ! lessThan(  4 ,  3  ) )
  checkTrue( ! lessThan( 'a', 'a' ) )
  checkTrue(   lessThan( 'a', 'b' ) )
  checkTrue( ! lessThan( 'b', 'a' ) )

  checkTrue(   lessOrEqual(  3 ,  3  ) )
  checkTrue(   lessOrEqual(  3 ,  4  ) )
  checkTrue( ! lessOrEqual(  4 ,  3  ) )
  checkTrue(   lessOrEqual( 'a', 'a' ) )
  checkTrue(   lessOrEqual( 'a', 'b' ) )
  checkTrue( ! lessOrEqual( 'b', 'a' ) )

  checkTrue( ! greaterThan(  3 ,  3  ) )
  checkTrue( ! greaterThan(  3 ,  4  ) )
  checkTrue(   greaterThan(  4 ,  3  ) )
  checkTrue( ! greaterThan( 'a', 'a' ) )
  checkTrue( ! greaterThan( 'a', 'b' ) )
  checkTrue(   greaterThan( 'b', 'a' ) )

  checkTrue(   greaterOrEqual(  3 ,  3  ) )
  checkTrue( ! greaterOrEqual(  3 ,  4  ) )
  checkTrue(   greaterOrEqual(  4 ,  3  ) )
  checkTrue(   greaterOrEqual( 'a', 'a' ) )
  checkTrue( ! greaterOrEqual( 'a', 'b' ) )
  checkTrue(   greaterOrEqual( 'b', 'a' ) )
  
  # test Logical Operators
  checkTrue(   logicalAnd(  TRUE,  TRUE ) )
  checkTrue( ! logicalAnd(  TRUE, FALSE ) )
  checkTrue( ! logicalAnd( FALSE,  TRUE ) )
  checkTrue( ! logicalAnd( FALSE, FALSE ) )

  checkTrue(   logicalOr(  TRUE,  TRUE ) )
  checkTrue(   logicalOr(  TRUE, FALSE ) )
  checkTrue(   logicalOr( FALSE,  TRUE ) )
  checkTrue( ! logicalOr( FALSE, FALSE ) )

  checkTrue( ! logicalXor(  TRUE,  TRUE ) )
  checkTrue(   logicalXor(  TRUE, FALSE ) )
  checkTrue(   logicalXor( FALSE,  TRUE ) )
  checkTrue( ! logicalXor( FALSE, FALSE ) )

  checkTrue( ! logicalNot(  TRUE ) )
  checkTrue(   logicalNot( FALSE ) )

}