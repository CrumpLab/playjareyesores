library(usethis)
create_package("../pname")
use_description_defaults()
use_gpl3_license()

use_roxygen_md()
use_readme_md()

pkgdown::build_site()
pkgdown::build_articles()
pkgdown::clean_site()
pkgdown::build_news()

use_news_md()

#function creation
use_r("multi_doc_compare")

use_rcpp(name = "rowSumsSq")

use_package("qdapRegex", "Suggests")
usethis::use_package("lsa")

usethis::use_pipe()

use_package_doc()
use_namespace()

use_vignette("Using_playjaReyesir")

use_pkgdown()



### create sample data

article_df <- article_df[1:100,]
article_vectors <- article_vectors[1:100,]
WordVectors <- WordVectors[1:100,]
author_list <- author_list[1:100]
dictionary_words <- dictionary_words[1:100]
AuthorVectors <- AuthorVectors[1:100,]

use_data(article_df,article_vectors,WordVectors,author_list,dictionary_words)
use_data(AuthorVectors)


