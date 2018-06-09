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
#' get_words("ihfjwd", 4)
#' get_words("hasfic", 4, TRUE)
#' @import rvest
#' @import dplyr
#' @import xml2

get_words <- function(letters, word_len = 0, wildcard = FALSE){

  if(wildcard == TRUE){
    link = link = paste0("https://word.tips/words-for/", letters, "*?is_search=true")
  } else {
    link = paste0("https://word.tips/words-for/", letters, "?is_search=true")
  }

  html <- xml2::read_html(link)
  html <- rvest::html_nodes(html, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "changeable-word", " " ))]')
  html <- rvest::html_text(html)
  if (identical(html,character(0))) {
    stop("No words :(")
  }
  if(word_len == 0) {return(html)} else{
    condition <- sapply(html, function(x) nchar(x) == word_len)
    return (html[condition])
  }
}

