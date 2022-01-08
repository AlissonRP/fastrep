#' pdf1_na
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' this is a very simple table of the quantity of NA by variable
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param ...     Other arguments
#' @examples
#' airquality %>%
#'   mypdf1::pdf1_na()
#' @export
pdf1_na <- function(obj, ...) {
  vec <- is.na(obj) |>
    as.data.frame() |>
    purrr::map_dbl(sum)
  dplyr::tibble(`Variavel` = names(vec), `Total_Na` = vec %>% as.vector())
}
