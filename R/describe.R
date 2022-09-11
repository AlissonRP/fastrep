#' describe
#'
#' In the base R we have the function summary, but the output is no by default
#' a `data.frame`, so `describe` is an enhancement of this function
#' to summarize data frames.
#'
#'
#' @param obj     Object used to create the table.
#' `data.frame`, `list` or environment
#' (or object coercible by `as.data.frame` to a `data.frame`)
#'
#' @param na_rm option to remove `NA` from variables

#' @examples
#' mtcars |>
#'   fastrep::describe()
#'
#' airquality |> fastrep::describe(na_rm = FALSE)
#'
#' iris |> fastrep::describe()
#'
#' @return A tibble with n rows where n is equal to `ncol(obj)` and  columns
#' with
#' the summary metrics
#'
#' @export
describe <- function(obj, na_rm = TRUE) {
  not_numeric <- obj |>
    dplyr::select(where(purrr::negate(is.numeric))) |>
    ncol()
  if ((not_numeric) != 0) {
    warning("string and factors variables were removed for calculations")
  }
  obj <- obj |>
    dplyr::select(where(is.numeric))
  if (na_rm == TRUE & any(is.na(obj))) {
    warning("Your dataframe has NA, they will be removed from calculations \n
  use na_rm = FALSE if you want to keep them")
  }


  funs <- c(mean = mean, median = median, sd = sd, min = min, max = max)
  args <- list(na.rm = na_rm)
  results <- obj |>
    purrr::map_df(~ funs %>%
      purrr::map(purrr::exec, .x, !!!args), .id = "variable")

  results |>
    dplyr::select(where(purrr::negate(is.numeric))) |>
    dplyr::bind_cols(results |>
      dplyr::select(where(is.numeric)) |>
      purrr::map_df(round, 3)) |>
    dplyr::bind_cols(rep_na(obj) |> dplyr::select(where(is.numeric)))
}
