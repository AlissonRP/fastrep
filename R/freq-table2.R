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
#' @param title     title for the table, write in string format
#' @param var1       Variable that you want the table (not written in string format)
#' @param var2       Variable that you want on the top of the table (not written in string format)
#' @param marg   Marginal row table, default is FALSE

#' @examples
#' mtcars |>
#'   mypdf1::pdf1_tbl_freq2(cyl, am, "title", marg = TRUE)
#' @export
pdf1_tbl_freq2 <- function(obj, var1, var2, title = "", marg = F) {
  if (any(is.na(obj |> dplyr::select({{ var1 }}, {{ var2 }}))) == TRUE) {
    warning("Your dataframe has NA, they will be removed from calculations")
  }
  tab <- obj |>
    tab({{ var1 }}, {{ var2 }})
  tab[is.na(tab)] <- 0
  if (marg != TRUE) {
    title2 <- obj |>
      dplyr::select({{ var2 }}) |>
      names()
    catlev <- nrow(unique(obj |>
      dplyr::select({{ var2 }}))) + 1
    tab <- tab |>
      janitor::adorn_totals("row") %>%
      janitor::adorn_totals("col") %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(title) |>
      kableExtra::add_header_above(c(" ", setNames(catlev, title2)), align = "c")
  } else {
    title2 <- obj |>
      dplyr::select({{ var2 }}) |>
      names()
    catlev <- nrow(unique(obj |>
      dplyr::select({{ var2 }})))
    tab <- tab |>
      janitor::adorn_percentages() %>%
      dplyr::ungroup() |>
      mypdf1::pdf1_tbl(title) |>
      kableExtra::add_header_above(c(" ", setNames(catlev, title2)), align = "c")
  }
  tab
}
