#' Get words from random letters
#'
#' @param letters random string of letters
#' @param word_len length of desired word
#'
#' @return returns a list with words made up from string of letters
#' @export
#'
#' @examples
#' get_words("uhwoih")
#' get_words("ihfjwd", 4)
#' @import stringr str_c
#' @import rvest
#' @import dplyr
#' @import xml2

get_words <- function(letters, word_len = 0, wildcard = FALSE){

  link = stringr::str_c("https://word.tips/words-for/", letters, "?is_search=true")
  html <- xml2::read_html(link)
  html <- rvest::html_nodes(html, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "changeable-word", " " ))]')
  html <- rvest::html_text(html)
  if(word_len == 0) {html} else{
    for(i in html){
      if (length(i) == word_len){
        # something here....
      }
    }
  }
}
