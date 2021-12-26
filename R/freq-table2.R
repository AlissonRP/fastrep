#' pdf1_freq.tbl
#'
#'this is a very simple frequency table generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param tit     Title for the table, write in string format
#' @param v1       Variable that you want the table (not written in string format)
#' @param v2       Variable that you want the table (not written in string format)
#' @param ...     Other arguments
#' @param marg   Marginal row table

#' @examples
#'iris %>%
#'mypdf1::pdf1_freq.tbl(Species,"title") %>%
#' @export
pdf1_freq.tbl2=function(obj,v1,v2,tit,marg=F){
  #if(missing(marg)){
    tab=obj %>%
      dplyr::group_by({{v1}},{{v2}}) %>%
      dplyr::summarise(n=dplyr::n())   %>%
      tidyr::spread({{v2}}, n)
      if(marg!=TRUE){
        title2=obj |>  dplyr::select({{v2}}) |> names()
        catlev=nrow(unique(obj |>
                             dplyr::select({{v2}})))+1
      tab=tab |>
      adorn_totals("row") %>%
      adorn_totals("col") %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(tit) |>
      kableExtra::add_header_above(c(" ", setNames(catlev,title2)), align ="c")


  } else {
    title2=obj |>  dplyr::select({{v2}}) |> names()
    catlev=nrow(unique(obj |>
                         dplyr::select({{v2}})))
    tab=tab |>
      adorn_percentages() %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(tit) |>
      kableExtra::add_header_above(c(" ", setNames(catlev,title2)), align ="c")


  }
  tab

}


