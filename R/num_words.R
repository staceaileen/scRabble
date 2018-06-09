#' Number of words
#'
#' @param letters string of characters to build words
#' @param word_len if desired, length of words to be returned
#' @param wildcard boolean to activate or not a wildcard
#'
#' @return returns an int with the number of possible words you can create
#' @export
#'
#' @examples
#' get_words("uhwoih")
#' get_words("ihfjwd", word_len = 4)
#' get_words("hasfic", wildcard = TRUE)
#' @import stringr
#' @import rvest
#' @import dplyr
#' @import xml2

num_words <- function(letters, word_len = 0, wildcard = FALSE){
  words <- get_words(letters, word_len, wildcard)
  num <- length(words)
  return(num)
}
