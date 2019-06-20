#' Multiple document comparison for textual overlap
#'
#' @param texts character vector of texts, each text is a string in the vector
#' @param n_grams integer to specify ngram units
#' @param sd_criterion numeric set a standard deviation criterion for returning documents that are unsually similar, 2-3 is pretty good
#'
#' @return list
#' - dtm matrix document term matrix for all texts
#' - histogram a histogram of the cosine similarity values between every text
#' - similarities matrix cosine similarities between every text
#' - mean_similarity numeric the mean similarity between all texts
#' - sd_similarity numeric the standard deviation of the similarities
#' - check_these dataframe document pairs that were above the criterion, might want to check these ones))
#' @export
#'
#' @examples
#'
multi_doc_compare <- function(texts, n_grams, sd_criterion){

  vc <- tm::VCorpus(tm::VectorSource(texts))

  NLP_tokenizer <- function(x) {
    unlist(lapply(NLP::ngrams(NLP::words(x), n_grams), paste, collapse = "_"), use.names = FALSE)
  }

  dtm <- tm::DocumentTermMatrix(vc,control=list(tokenize=NLP_tokenizer))
  dtm <- as.matrix(dtm)
  sim_mat <- lsa::cosine(t(dtm))

  histogram <- hist(sim_mat[lower.tri(sim_mat)])
  sdev <- sd(sim_mat[lower.tri(sim_mat)])
  mean_sim <- mean(sim_mat[lower.tri(sim_mat)])
  outlier <- mean(sim_mat[lower.tri(sim_mat)]) + sd_criterion*sd(sim_mat[lower.tri(sim_mat)])

  sim_mat[sim_mat>outlier]

  fishy <- as.data.frame(which(sim_mat > outlier, arr.ind=TRUE)) %>%
    dplyr::mutate(same = row == col) %>%
    dplyr::filter(same == FALSE)
  check_these <- fishy[1:(dim(fishy)[1]/2),]
  check_these <- cbind(paper1 = file_paths[check_these$row],
                       paper2 = file_paths[check_these$col])

  return(list(dtm = dtm,
              histogram = histogram,
              similarities = sim_mat,
              mean_similarity = mean_sim,
              sd_similarity = sdev,
              check_these = check_these))

}
