# playjareyesores

<!-- badges: start -->
<!-- badges: end -->

**Very much still in development, mainly for fun right now, but seems to be working for (at least for me, for now)**

The goal of playjareyesores is to provide some useful functions for detecting textual overlap between documents. See the article for an example.

**Note**: the `clean_2_col_pdf()` function requires the `tabulizer` package, which unfortunately also requries a java installation. However, the rest of the functions do not require `tabulizer`. If you can get your documents into a string, then you should be able to run the functions (provided the text is cleaned properly...still haven't found a cure-all for cleaning up all of the possible issues with text).

## Installation

You can install the released version of playjareyesores from.

``` r
devtools::install_github("CrumpLab/playjareyesores")
```


