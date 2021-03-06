#' load and clean 2 column pdf
#'
#' @param file a file path
#'
#' @return character string of cleaned text
#' @description Note this function requires the tabulizer package, which also requires a java installation. It is a useful function for reading in two-column pdfs often found in the scientific literature.
#' @export
#'
#' @examples
#'
clean_2_col_pdf <- function(file){
  rm_newline <- qdapRegex::rm_(pattern="\n", replacement = " ")
  rm_dash <- qdapRegex::rm_(pattern="- ", replacement = "")
  rm_dash2 <- qdapRegex::rm_(pattern="-", replacement = " ")
  paper <- tabulizer::extract_text(file)
  paper <- paper %>%
    rm_newline() %>%
    rm_dash() %>%
    rm_dash2() %>%
    tolower()
  return(paper)
}
