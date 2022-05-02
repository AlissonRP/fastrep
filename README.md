# mypdf1 <img src='man/figures/fig/mypdf1.png' align="right" height="130" /></a>

[![R build
status](https://github.com/tidyverse/ggplot2/workflows/R-CMD-check/badge.svg)](https://github.com/AlissonRP/mypdf1/actions)
[![Codecov 
test coverage](https://codecov.io/gh/AlissonRP/mypdf1/branch/main/graph/badge.svg)](https://app.codecov.io/gh/AlissonRP/mypdf1?branch=main)






## Overview
Whenever I created a file in Rmarkdown, there was a pattern of necessary packages and functions that I almost always used.  
So this package provides a template for pdf reports in Rmarkdown and quite usual functions, note that it is a package more *aggregator* than creator.   

## Instalation
```r
devtools::install_github("https://github.com/AlissonRP/mypdf1")
```
### Recommendation
To generate a pdf in Rmarkdown is recommended to use [`tinytex`](https://cran.r-project.org/web/packages/tinytex/index.html). If you don't have, use:

```r
tinytex::install_tinytex()
```

## Use of default template
```r
rmarkdown::draft("namefile.Rmd", template = "pdf1", package = "mypdf1")
```
## Use of paper template

```r
rmarkdown::draft("namefile.Rmd", template = "pdf1-paper", package = "mypdf1", create_dir = FALSE)
```

## Some functions already available
* `pdf1_tbl`: This function is used to generate tables
* `pdf1_freq_tbl`: This function assists in creating frequency tables (`tibble`) 
* `pdf1_freq_tbl2`: 2x2 table, values can be absolute or marginal rows using argument `marg = TRUE`
* `pdf1_na`: Inform the amount of `NA` per variable
* `pdf1_summary`: Summarize the `data.frame` outputting a `tibble`
