library(scRabble)

context("Get Words")

test_that("We get words froma string of chars", {
  expect_equal(get_words("cat"), c("cat","act","at","ta"))
  expect_equal(get_words("cat", 3), c("cat","act"))
})
