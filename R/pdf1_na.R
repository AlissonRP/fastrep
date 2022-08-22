#' pdf1_na
#'
#'
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function counts the number of NA by variable in your data.frame
#'
#' @param obj Object used to create the table.
#'
#' `data.frame`, `list` or environment
#' (or object coercible by `as.data.frame` to a `data.frame`)
#' @param ...     Other arguments
#' @examples
#' airquality %>%
#'   mypdf1:::pdf1_na()
#' @return A tibble with n rows where n is equal to `ncol(obj)` and 2 columns
#'
pdf1_na <- function(obj, ...) {
  lifecycle::deprecate_soft(
    when = "0.6",
    what = "pdf1_na()",
    details = "Use pdf1_summary instead"
  )
  vec <- is.na(obj) |>
    as.data.frame() |>
    purrr::map_dbl(sum)
  dplyr::tibble(`variable` = names(vec), `na_count` = vec %>% as.vector())
}
