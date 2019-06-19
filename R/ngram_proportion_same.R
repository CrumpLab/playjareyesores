#' Proportion n gram overlap
#'
#' @param a character string of text
#' @param b character string of text
#' @param n_grams integer number of ngrams
#'
#' @return numeric proportion of ngram overlap
#' @export
#'
#' @examples
#' p1 <- "hello my name is someone someone"
#' p2 <- "my name is someone else"
#' ngram_proportion_same(p1,p2,2)
ngram_proportion_same<- function(a,b,n_grams){
  docs <- c(a,b)
  vc <- tm::VCorpus(tm::VectorSource(docs))

  NLP_tokenizer <- function(x) {
    unlist(lapply(NLP::ngrams(NLP::words(x), n_grams), paste, collapse = "_"), use.names = FALSE)
  }
  dtm <- tm::DocumentTermMatrix(vc,control=list(tokenize=NLP_tokenizer))
  dtm <- as.matrix(dtm)
  sum_col <- colSums(dtm)
  division <- t(t(dtm)/sum_col)
  division[division == 1] <- 0
  sum_up<-colSums(division)
  return(sum(sum_up)/length(sum_up))
}
