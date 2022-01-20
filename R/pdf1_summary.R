#' pdf1_summary()
#'
#'this is a very summary  generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)

#' @examples
#' mtcars |>
#' mypdf1::pdf1_summary()
#' @export
pdf1_summary=function(obj,na=TRUE){
  obj =  obj |>
          dplyr::select(where(is.numeric))

  funs <- c(mean = mean, median = median,sd=sd,min=min,max=max)
  args <- list(na.rm = na)
  obj |>
    purrr::map_df(~ funs %>%
                    purrr::map(purrr::exec, .x, !!!args), .id = "var")

}


