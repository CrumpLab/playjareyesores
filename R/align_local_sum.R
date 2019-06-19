#' summarize align local output
#'
#' @param al_var list produced by align local
#'
#' @return list
#' - df dataframe of words in a an d
#' - sum integer number of words the same
#' - sentence string the sentence
#' @export
#'
#' @examples
#'
align_local_sum <- function(al_var){
  a<-unlist(strsplit(al_var$a_edits,split=" "))
  b<-unlist(strsplit(al_var$b_edits,split=" "))
  df<-data.frame(a,b) %>%
    dplyr::mutate(a = as.character(a),
                  b = as.character(b),
                  same = a==b) %>%
    dplyr::filter(same == TRUE)
  return(list(df=df,
              sum = dim(df)[1],
              sentence = paste(df$a,collapse = " ")))
}
