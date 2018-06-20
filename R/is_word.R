#' Determines if a string of characters is a word.
#'
#' @param word string of letter
#'
#' @return string saying if the input is an actual word or not
#' @export
#'
#' @examples
#' is_word("hello")
#' is_word("hbkjwfen")
#' @import rvest
#' @import dplyr
#' @import xml2

is_word <- function(word){
  link = paste0("https://www.merriam-webster.com/dictionary/", word)

  xpath_wrong = '//*[contains(concat( " ", @class, " " ), concat( " ", "secondary", " " ))]'
  xpath_cor = '//*[contains(concat( " ", @class, " " ), concat( " ", "hword", " " ))]'
  html <- "notaword"
  try(html <- xml2::read_html(link))
  if(html == "notaword"){
    return FALSE
  } else{
    return TRUE
  }
}
