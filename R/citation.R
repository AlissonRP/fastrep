#' citation
#' How to cite `mypdf1` in your publications!

#' @export
pdf1_citation = function(){
  cat(paste("To cite mypdf1 in publications use in your BibTeX: \n","\n",
            "@Manual{pdf1,
  title = {mypdf1: mypdf1},
  author = {Alisson Rosa},
  year = {2022},
  note = {R package version 0.7},
}"))
}

#' @return A print in console indicating how to cite the package.
