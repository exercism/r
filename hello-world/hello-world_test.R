test.hello.world <- function() {
  
  # default filename is example.R
  filename <- "example.R"
  
  # check for hello-world.R
  if (file.exists("hello-world.R")) filename <- "hello-world.R"
  
  # load the code to be tested
  source(filename)
  
  # test the output
  checkEquals(say.hello(), "Hello, World!")
}