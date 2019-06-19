#' clean load 1 column pdf
#'
#' @param file a file path
#'
#' @return character string of text
#' @export
#'
#' @examples
#'
clean_1_col_pdf <- function(file){
  rm_newline <- qdapRegex::rm_(pattern="\n", replacement = " ")
  rm_dash <- qdapRegex::rm_(pattern="- ", replacement = "")
  rm_dash2 <- qdapRegex::rm_(pattern="-", replacement = " ")
  paper <- pdftools::pdf_text(file)
  paper <- paste(paper, collapse=" ")
  paper <- paper %>%
    rm_newline() %>%
    rm_dash() %>%
    rm_dash2() %>%
    tolower()
  return(paper)
}
