#' pdf1_freq.tbl
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#'
#' this is a very simple  frequency 2x2 table generator
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param tit     Title for the table, write in string format
#' @param v1       Variable that you want the table (not written in string format)
#' @param v2       Variable that you want on the top of the table (not written in string format)
#' @param ...     Other arguments
#' @param marg   Marginal row table, default is FALSE

#' @examples
#' mtcars |>
#'   mypdf1::pdf1_freq.tbl2(cyl, am, "tit", marg = TRUE)
#' @export
pdf1_freq.tbl2 <- function(obj, v1, v2, tit, marg = F) {
  tab <- obj %>%
    dplyr::group_by({{ v1 }}, {{ v2 }}) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    tidyr::spread({{ v2 }}, n)
  if (marg != TRUE) {
    title2 <- obj |>
      dplyr::select({{ v2 }}) |>
      names()
    catlev <- nrow(unique(obj |>
      dplyr::select({{ v2 }}))) + 1
    tab <- tab |>
      janitor::adorn_totals("row") %>%
      janitor::adorn_totals("col") %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(tit) |>
      kableExtra::add_header_above(c(" ", setNames(catlev, title2)), align = "c")
  } else {
    title2 <- obj |>
      dplyr::select({{ v2 }}) |>
      names()
    catlev <- nrow(unique(obj |>
      dplyr::select({{ v2 }})))
    tab <- tab |>
      janitor::adorn_percentages() %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(tit) |>
      kableExtra::add_header_above(c(" ", setNames(catlev, title2)), align = "c")
  }
  tab
}
