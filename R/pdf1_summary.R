#' pdf1_summary()
#'
#' this is a very simple summary  generator
#'
#'
#' @param obj     Object used to create the table.
#'
#' `data.frame`, `list` or environment
#' (or object coercible by `as.data.frame` to a `data.frame`)
#'
#' @param na_rm option to remove `NA` from variables

#' @examples
#' mtcars |>
#'   mypdf1::pdf1_summary()
#'
#' airquality |> mypdf1::pdf1_summary(na_rm = FALSE)
#'
#' iris |> mypdf1::pdf1_summary()
#' @export
pdf1_summary <- function(obj, na_rm = TRUE) {
  char <- obj |>
    dplyr::select(where((is.character))) |> # dumb i know
    ncol()
  fac <- obj |>
    dplyr::select(where((is.factor))) |> # dumb i know
    ncol()
  if ((char + fac) != 0) {
    warning("string and factors variables were removed for calculations")
  }
  obj <- obj |>
    dplyr::select(where(is.numeric))
  if (na_rm == TRUE & any(is.na(obj))) {
    warning("Your dataframe has NA, they will be removed from calculations \n  use na_rm = FALSE if you want to keep them")
  }


  funs <- c(mean = mean, median = median, sd = sd, min = min, max = max)
  args <- list(na.rm = na_rm)
  obj |>
    purrr::map_df(~ funs %>%
      purrr::map(purrr::exec, .x, !!!args), .id = "variable")
}
