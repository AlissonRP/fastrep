#' pdf1_summary()
#'
#' this is a very summary  generator
#'
#'
#' @param obj     Object used to create the table. Data frame, list or environment
#' (or object coercible by as.data.frame to a data frame)
#' @param na_rm option to remove NA from variables
#' @param use_num option to use only numeric variables

#' @examples
#' mtcars |>
#'   mypdf1::pdf1_summary()
#'
#' airquality |> mypdf1::pdf1_summary(na_rm = FALSE)
#'
#' iris |> mypdf1::pdf1_summary(use_num = TRUE)
#' @export
pdf1_summary <- function(obj, na_rm = TRUE, use_num = FALSE) {
  if (use_num == TRUE) {
    obj <- obj |>
      dplyr::select(where(is.numeric))
  } else if (3 > 2) {
    char <- obj |>
      dplyr::select(where((is.character))) |> # dumb i know
      ncol()
    fac <- obj |>
      dplyr::select(where((is.factor))) |> # dumb i know
      ncol()
    if ((char + fac) != 0) {
      stop("Summary only for numeric variables \n use use_num=TRUE")
    }
  }




  funs <- c(mean = mean, median = median, sd = sd, min = min, max = max)
  args <- list(na.rm = na_rm)
  obj |>
    purrr::map_df(~ funs %>%
      purrr::map(purrr::exec, .x, !!!args), .id = "var")
}
