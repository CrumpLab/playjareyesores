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
ngram_proportion_same<- function(a,b,n_grams,show="none"){
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
  if(show == "none"){
    return(sum(sum_up)/length(sum_up))
  }
  if(show =="ngrams"){
    the_grams <- names(sum_up[sum_up>0])
    the_grams <- gsub("_"," ",the_grams)
    temp_a <- tolower(a)
    temp_b <- tolower(b)
    for(i in 1:length(the_grams)){
      temp_a <- stringr::str_replace_all(temp_a,
                            the_grams[i],
                            toupper(the_grams[i]))
      temp_b <- stringr::str_replace_all(temp_b,
                                         the_grams[i],
                                         toupper(the_grams[i]))
    }

    return(list(sum = sum(sum_up)/length(sum_up),
                the_grams = the_grams,
                a_print = temp_a,
                b_print = temp_b))
  }
}
