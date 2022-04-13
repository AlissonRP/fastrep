#' pdf1_freq_tbl
#'
#' this is a very simple frequency table generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param var       Variable that you want the table (not written in string format)
#' @examples
#' iris %>%
#'   mypdf1::pdf1_tbl_freq(Species) %>%
#'   mypdf1::pdf1_tbl(" You can combine this function too!")
#' @export
pdf1_tbl_freq <- function(obj, var) {
  obj %>%
    dplyr::count({{ var }}) %>%
    dplyr::mutate(`relative_frequency` = prop.table(n) %>% round(3)) %>%
    dplyr::rename(`absolute_frequency` = n) %>%
    janitor::adorn_totals("row") |>
    dplyr::tibble()
}
