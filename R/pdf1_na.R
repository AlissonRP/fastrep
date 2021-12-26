#' pdf1_na
#'
#'this is a very simple frequency table generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param ...     Other arguments
#' @examples
#'airquality %>%
#'mypdf1::pdf1_na() %>%
#' @export
pdf1_na=function(obj,...){
  vec=is.na(obj) |>
    as.data.frame() |>
    purrr::map_dbl(sum)
dplyr::tibble(`Variável`=names(vec),`Total_Na`=vec %>%  as.vector())
}
