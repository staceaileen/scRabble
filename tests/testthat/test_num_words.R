library(scRabble)

context("Num Words")

test_that("How many words could we write?", {
  expect_equal(num_words("cat"), 4)
  expect_equal(num_words("cat", 3), 2)
  expect_equal(num_words("cat", 3, TRUE), 64)
})
