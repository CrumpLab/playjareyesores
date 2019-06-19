#' clean and load a plain text file
#'
#' @param file a path to file
#'
#' @return character string of text
#' @export
#'
#' @examples
#'
clean_plain_txt <- function(file){
  rm_newline <- qdapRegex::rm_(pattern="\n", replacement = " ")
  rm_dash <- qdapRegex::rm_(pattern="- ", replacement = "")
  rm_dash2 <- qdapRegex::rm_(pattern="-", replacement = " ")
  paper <- scan(file, what=character())
  paper <- paste(paper,collapse=" ")
  paper <- paper %>%
    rm_newline() %>%
    rm_dash() %>%
    rm_dash2() %>%
    tolower()
}
