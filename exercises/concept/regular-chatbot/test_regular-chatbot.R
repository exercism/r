source("./regular-chatbot.R")
library(testthat)

test_that("1. Check valid command", {
  # Recognizes whether the command is at the first position
  expect_true(is_valid_command("Chatbot, Do you understand this command?"))
  expect_false(is_valid_command("Hey Chatbot, please tell me what is the weather for tomorrow."))

  # Does not care about UPPER/lower case
  expect_true(is_valid_command("CHATBOT, Is it okay if I shout at you?"))
  expect_true(is_valid_command("chatbot, please tell me what is happening here."))
})


test_that("2. Remove encrypted emojis", {
  expect_equal(remove_emoji("What was your name? emoji2134 Sorry I forgot about it."),
               "What was your name?  Sorry I forgot about it."
  )
  
  expect_equal(remove_emoji("emoji5321 How about ordering emoji8921 ?"),
                             " How about ordering  ?"
  )
})

test_that("3. Check Valid Phone Number", {
  # valid numbers
  expected <- "Thanks! You can now download me to your phone."
  expect_equal(check_phone_number("(+34) 643-876-459"), expected)
  expect_equal(check_phone_number("(+49) 543-928-190"), expected)
  
  # invalid numbers
  expect_equal(check_phone_number("322-787-654"),
               "Oops, it seems like I can't reach out to 322-787-654")
  expect_equal(check_phone_number("4355-67-274"),
               "Oops, it seems like I can't reach out to 4355-67-274")
})

test_that("4. Greet the user", {
  expect_equal(nice_to_meet_you("Sanz, Pablo"), "Nice to meet you, Pablo Sanz")
  expect_equal( nice_to_meet_you("Stephan, Sandro"), "Nice to meet you, Sandro Stephan")
})

test_that("5. Get website link", {
  expect_equal(get_URL("You can check more info on youtube.com"),  #nolint
               c("youtube.com"))
  expect_equal(get_URL("That was from reddit.com and notion.so"),  #nolint
               c("reddit.com", "notion.so"))

})
