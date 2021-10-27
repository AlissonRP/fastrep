#' pdf1_tbl
#'
#'this is a very simple table generator
#'
#'
#' @param obj     Object used to create the table
#' @param tit     Title for the table, write in string format
#' @param ...     Other arguments
#'
#' @export
pdf1_tbl=function(obj,tit,...){
  obj %>%
    kableExtra::kable(caption=tit,align = "c") |>
    kableExtra::kable_classic(latex_options = "HOLD_position")
}
