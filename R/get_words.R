#' Get words from random letters
#'
#' @param letters random string of letters
#' @param word_len length of desired word
#' @param wildcard boolean indicating if there's a wildcard
#'
#' @return returns a list with words made up from string of letters
#' @export
#'
#' @examples
#' get_words("uhwoih")
#' get_words("ihfjwd", word_len = 4)
#' get_words("hasfic", wildcard = TRUE)
#' @import stringr str_c
#' @import rvest
#' @import dplyr
#' @import xml2

get_words <- function(letters, word_len = 0, wildcard = FALSE){

  if(wildcard == TRUE){
    link = link = stringr::str_c("https://word.tips/words-for/", letters, "*?is_search=true")
  } else {
    link = stringr::str_c("https://word.tips/words-for/", letters, "?is_search=true")
  }

  html <- xml2::read_html(link)
  html <- rvest::html_nodes(html, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "changeable-word", " " ))]')
  html <- rvest::html_text(html)
  if(word_len == 0) {return(html)} else{
    condition <- sapply(html, function(x) nchar(x) == word_len)
    return (html[condition])
  }
}

