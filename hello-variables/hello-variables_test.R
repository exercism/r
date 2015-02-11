test.hello.variables <- function() {
  
  # default filename is example.R
  filename <- "example.R"
  
  # check for hello-world.R
  if (file.exists("hello-variables.R")) filename <- "hello-variables.R"
  
  # load the code to be tested
  source(filename)
  
  # test the output
  checkEquals(say.hello.to("Bob"), "Hello, Bob!")
}