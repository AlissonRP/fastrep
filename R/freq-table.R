#' pdf1_freq_tbl
#'
#' This function creates a frequency table, you only need to supply a
#' data.frame and the variable to make the table.
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param var       Variable that you want the table (not written in string format)
#' @param sort_by      Variable you want to sort the `tibble`
#' @param desc if you want decreasing order put `FALSE`
#' @note By default the `sort_by` is in alphabetical order of `{{ var }}`
#' @examples
#' iris %>%
#'   mypdf1::pdf1_tbl_freq(Species) %>%
#'   mypdf1::pdf1_tbl("You can combine this function too!")
#'
#' @return A tibble with 4 rows and 3 columns
#'
#' @export
pdf1_tbl_freq <- function(obj, var, sort_by = {{var}}, desc = F)
{
  non_order <- obj %>%
    dplyr::count({{ var }}) %>%
    dplyr::mutate(`relative_frequency` = prop.table(n) %>% round(4)) %>%
    dplyr::rename(`absolute_frequency` = n)
  if (desc == T) {
    non_order |>
      dplyr::arrange(dplyr::desc({{ sort_by }})) |>
      janitor::adorn_totals("row") |>
      dplyr::tibble()
  } else {
    non_order |>
      dplyr::arrange({{ sort_by }}) |>
      janitor::adorn_totals("row") |>
      dplyr::tibble()
  }
}
