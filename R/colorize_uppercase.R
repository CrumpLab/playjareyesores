#' highlight uppercase words
#'
#' @param text string of text
#' @param color a color code for html css
#'
#' @return text string of text with css span color set to red for uppercase words
#'
#' @description This function detects uppercase words, then wraps them with an HTML span. These spans are given the id = ngram, and a color specified by color. The ngram id could be used in css to further customize the style of the highlighted text.
#' @export
#'
#' @examples
#'
colorize_uppercase <- function(text, color="red"){
  temp <- unlist(strsplit(text,split=" "))
  temp <- sapply(temp,FUN=function(x)
    stringr::str_replace(x,"[A-Z]+",paste("<span id='ngram' style='color:",
                                    color,
                                    ";'>",
                                    x,
                                    "</span>")),
    USE.NAMES = FALSE)
  return(paste(temp,collapse=" "))
}
