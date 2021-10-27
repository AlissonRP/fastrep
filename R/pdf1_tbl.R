#' pdf1_tbl
#'
#' function to print  a table
#'
#' @param v     Objeto a ser printado
#' @param tit   titulo da tabela
#'
#' @return não sei
#'
#' @export
pdf1_tbl=function(v,tit){
  v %>%
    kableExtra::kable(caption=tit,align = "c") |>
    kableExtra::kable_classic(latex_options = "HOLD_position")
}
