library(scRabble)

context("Is Word")

test_that("testing if it's a word", {
  expect_equal(is_word("cat"), c("It is a word!"))
  expect_equal(is_word("tfeweqffc"), c("Not a word, sorry bro"))
})
