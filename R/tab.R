#' tab
#'
#'
#' This function is used to create `cross_tbl`
#'
#' @param obj     Object used to create the table. Data frame, list, or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param var1       Variable that you want the table (not written in string format)
#' @param var2       Variable that you want on the top of the table (not written in string format)
#' @examples
#' mtcars |>
#'   fastrep::cross_tbl(cyl, am)
#'
#' @return A tibble to create `cross_tbl`
tab <- function(obj, var1, var2) {
  obj %>%
    dplyr::group_by({{ var1 }}, {{ var2 }}) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    tidyr::spread({{ var2 }}, n)
}
