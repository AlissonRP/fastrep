#' pdf1_summary()
#'
#'this is a very summary  generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)

#' @examples
)
#' @export
pdf1_summary(obj){

}

funs <- c(mean = mean, median = median,sd=sd,min=min,max=max)
args <- list(na.rm = TRUE)

mtcars %>%
  purrr::map_df(~ funs %>%
           purrr::map(purrr::exec, .x, !!!args), .id = "var")

