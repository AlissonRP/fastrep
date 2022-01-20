#' pdf1_freq.tbl
#'
#' this is a very simple frequency table generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param var       Variable that you want the table (not written in string format)
#' @param ...     Other arguments
#' @examples
#' iris %>%
#'   mypdf1::pdf1_tbl_freq(Species, "title") %>%
#'   mypdf1::pdf1_tbl(" You can combine this function too!")
#' @export
pdf1_tbl_freq <- function(obj, var) {
  obj %>%
    dplyr::count({{ var }}) %>%
    dplyr::mutate(`Frequência Relativa` = prop.table(n) %>% round(3)) %>%
    dplyr::rename(`Frequência Absoluta` = n) %>%
    janitor::adorn_totals("row") |>
    dplyr::tibble()
}
