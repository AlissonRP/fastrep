# fastrep <img src='man/figures/fig/Rep1.png' align="right" height="130" /></a>

[![R build
status](https://github.com/tidyverse/ggplot2/workflows/R-CMD-check/badge.svg)](https://github.com/AlissonRP/fastrep/actions)
[![Codecov 
test coverage](https://codecov.io/gh/AlissonRP/fastrep/branch/main/graph/badge.svg)](https://app.codecov.io/gh/AlissonRP/fastrep?branch=main)



# Documentation

You can consult the documentation [here](https://cran.r-project.org/web/packages/fastrep/vignettes/my-vignette.html)


## Overview
Whenever I created a file in Rmarkdown, there was a pattern of necessary packages and functions that I almost always used.  
So this package provides a template for pdf reports in Rmarkdown and quite usual functions, note that it is a package more *aggregator* than creator.   



## Installation

```r
install.packages("fastrep")
```


```r
devtools::install_github("https://github.com/AlissonRP/fastrep")
```

### Recommendation
To generate a pdf in Rmarkdown is recommended to use [`tinytex`](https://cran.r-project.org/package=tinytex). If you don't have, use:

```r
tinytex::install_tinytex()
```

## Use of default template
```r
rmarkdown::draft("namefile.Rmd", template = "fast_report", package = "fastrep")
```
## Use of paper template

```r
rmarkdown::draft("namefile.Rmd", template = "fast_paper", package = "fastrep", create_dir = FALSE)
```

## Functions available
* `tbl`: This function is used to generate tables
* `freq_tbl`: This function assists in creating frequency tables (`tibble`) 
* `cross_tbl`: 2x2 table, values can be absolute or marginal rows using argument `marg = TRUE`
* `describe`: Summarize the `data.frame` outputting a `tibble`
