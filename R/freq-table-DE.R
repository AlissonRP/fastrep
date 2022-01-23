#' pdf1_freq.tbl
#'
#' this is a very simple frequency table generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param tit     Title for the table, write in string format
#' @param v       Variable that you want the table (not written in string format)
#' @param ...     Other arguments
#' @examples
#' iris %>%
#'   mypdf1::pdf1_freq.tbl(Species, "title") %>%
#'   mypdf1::pdf1_tbl(" You can combine this function too!")
#' @export
pdf1_freq.tbl <- function(obj, v, tit) {
  stop("Esta função foi renomeada, use pdf1_tbl_freq")
}
