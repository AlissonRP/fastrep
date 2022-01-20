# mypdf1 (em construção)

Whenever I created a file in Rmarkdown (mainly for [Sigma JR](https://www.instagram.com/_sigmajr/)), there was a pattern of necessary packages and functions that I almost always used  
So this package provides a template for pdf reports in Rmarkdown and quite usual functions, note that it is a package more *aggregator* than creator.   

## Instalation
```r
devtools::install_github("https://github.com/AlissonRP/mypdf1")
```
## Use of template
```r
rmarkdown::draft("namefile.Rmd", template = "pdf1", package = "mypdf1")
```

## Some functions already available
* `pdf1_tbl`: This function is used to generate tables
* `pdf1_freq.tbl`: This function assists in creating frequency tables (`tibble`) 
* `pdf1_freq.tbl2`: 2x2 table, values can be absolute or marginal rows using argument `marg=TRUE`
* `pdf1_na`: Inform the amount of `NA` per variable
* `pdf1_summary`: Summarize the `data.frame` outputting a `tibble`
