#' Produce ngram report in rmd for html
#'
#' @param out list from ngrams_analysis
#' @param print_n integer number of ngram examples to print for each ngram type
#' @param highlight_n string "ngram4" the name of the ngram unit, for printing entire text for comparison, ngrams that are the same between texts are printed in red and uppercase.
#'
#' @return cat text which is printed below the knitr chunk
#' @export
#'
#' @examples
#'
ngrams_report <-  function(out,print_n,highlight_n){

  proportion_df <- data.frame()
  for(i in 1:length(out)){
    t_df <- data.frame(ngram = names(out[i]),
                       proportion = out[[i]]$proportion,
                       count = length(out[[i]]$the_grams),
                       total_unique = length(out[[i]]$the_grams)/out[[i]]$proportion)
    proportion_df <- rbind(proportion_df,t_df)
  }
  t<-knitr::kable(proportion_df)

  cat(c("## Ngram descriptives",
        "\n"))
  cat(t, sep="\n")
  cat("\n")

  if(print_n >= 1){
    cat(c("## Ngram examples","\n"))
    for(i in 1:length(out)){
      cat(c("### ",names(out[i])),"\n")
      cat(out[[i]]$the_grams[1:print_n], sep="\n\n")
      cat("\n")
    }
  }

  if(highlight_n %in% names(out) == TRUE){
    cat("<div class = 'row'>",
        "<div class = 'col-md-6'>", sep="\n")
    cat("## ",out[[highlight_n]]$a_title,"\n")
    cat(colorize_uppercase(out[[highlight_n]]$a_print),"\n")
    cat("</div>","\n")
    cat("<div class = 'col-md-6'>","\n")
    cat("## ",out[[highlight_n]]$b_title,"\n")
    cat(colorize_uppercase(out[[highlight_n]]$b_print),"\n")
    cat("</div>","\n")
    cat("</div>")
  }

}
