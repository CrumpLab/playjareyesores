#' Turn uppercase words red
#'
#' @param text string of text
#'
#' @return text string of text with css span color set to red for uppercase words
#' @export
#'
#' @examples
#'
colorize_uppercase <- function(text){
  temp <- unlist(strsplit(text,split=" "))
  temp <- sapply(temp,FUN=function(x)
    stringr::str_replace(x,"[A-Z]+",paste("<span style='color:red;'>",
                                 x,
                                 "</span>")),
    USE.NAMES = FALSE)
  return(paste(temp,collapse=" "))
}
