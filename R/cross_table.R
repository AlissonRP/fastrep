#' cross_tbl
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#'
#' This function makes cross tables, like all functions from fastrep
#' you need to supply a data.frame, and in this case two variables.
#'
#' @param obj     Object used to create the table. Data frame, list, or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param title     title for the table, write in string format
#' @param var1       Variable that you want the table (not written in string format)
#' @param var2       Variable that you want on the top of the table (not written in string format)
#' @param marg   Marginal row table, default is FALSE

#' @examples
#' mtcars |>
#'   fastrep::cross_tbl(cyl, am, "title", marg = TRUE)
#'
#' @return A knitr_kable with 2x2 table fitted
#'
#' @export
#'
cross_tbl <- function(obj, var1, var2, title = "", marg = FALSE) {
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
      fastrep::tbl(title) |>
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
      fastrep::tbl(title) |>
      kableExtra::add_header_above(c(" ", setNames(catlev, title2)), align = "c")
  }
  tab
}
