#' Copmutes the number of points in a scrabble word.
#'
#' @param word # string of letters
#' @param locations # list of special letter score tile locations within the word
#' @param multiples # double or tripple letter score corrosponding to letter index
#' @param dw # number of double word scores
#' @param tw # number of tripple word scores
#'
#' @return # total score
#' @export
#'
#' @examples
#' points("botch", c(1,2,1,2,1), dw = 2)
points <- function(word, point.mult = rep(1, nchar(word)), dw = 0, tw = 0) {
  print(nchar(word))
  print(length(point.mult))
  if (length(point.mult) != nchar(word)) {
    stop("Length of multiples must equal length of word.")
  }
  indiv_letters <- data.frame(
    letter = strsplit(word, "") # not sure if this works
  )
  names(indiv_letters) <- "letter"
  cell <- dplyr::inner_join(indiv_letters, tile_values)$value * point.mult
  before_multiple <- sum(cell)
  multiple2 <- 2*dw
  multiple3 <- 3*tw
  if (multiple2 == 0 && multiple3 == 0) {
    multiple <- 1
  }
  else if (multiple2 == 0) {
    multiple <- multiple3
  }
  else if (multiple3 == 0) {
    multiple <- multiple2
  }
  else {
    multiple <- multiple2 * multiple3
  }
  score <- before_multiple * multiple
}
