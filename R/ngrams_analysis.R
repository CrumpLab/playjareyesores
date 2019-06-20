#' Proportion ngram overlap for a range of ngrams
#'
#' @param a string of text
#' @param b string of text
#' @param range integer vector for ngram range (e.g., 3:5)
#'
#' @return list of lists, each list contains:
#' - proportion numeric of overlapping ngrams
#' - the_grams character vector of ngrams that overlap
#' - a_print string the first document, with
#' @export
#'
#' @examples
#'
ngrams_analysis <- function(a,b,range, meta="none"){
  test <- lapply(range,FUN = function(x) ngram_proportion_same(a,b,x,show="ngrams",meta))
  names(test) <- paste("ngram",range,sep="")
  return(test)
}
