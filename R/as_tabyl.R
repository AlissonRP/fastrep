as_tabyl <- function(dat, axes = 2, row_var_name = NULL, col_var_name = NULL) {
  if ("tabyl" %in% class(dat)) {
    return(dat)
  }
  if (!axes %in% 1:2) {
    stop("axes must be either 1 or 2")
  }


  if (!is.data.frame(dat)) {
    stop("input must be a data.frame")
  }
  if (sum(unlist(lapply(dat, is.numeric))[-1]) == 0) {
    stop("at least one one of columns 2:n must be of class numeric")
  }


  attr(dat, "core") <- as.data.frame(dat)
  attr(dat, "tabyl_type") <- dplyr::case_when(
    axes == 1 ~ "one_way",
    axes == 2 ~ "two_way"
  )
  class(dat) <- c("tabyl", class(dat))

  if (!missing(row_var_name) | !missing(col_var_name)) {
    if (axes != 2) {
      stop("variable names are only meaningful for two-way tabyls")
    }
    attr(dat, "var_names") <- list(row = row_var_name, col = col_var_name)
  }

  dat
}

#' @title Remove \code{tabyl} attributes from a data.frame.
#'
#' @description
#' Strips away all \code{tabyl}-related attributes from a data.frame.
#'
#' @param dat a data.frame of class \code{tabyl}.
#' @return Returns the same data.frame, but without the \code{tabyl} class and attributes.
#' @export
#' @examples
#'
#' mtcars %>%
#'   tabyl(am) %>%
#'   untabyl() %>%
#'   attributes() # tabyl-specific attributes are gone

untabyl <- function(dat) {
  if (is.list(dat) && !is.data.frame(dat)) {
    purrr::map(dat, untabyl)
  } else {
    if (!"tabyl" %in% class(dat)) {
      warning("untabyl() called on a non-tabyl")
    }
    class(dat) <- class(dat)[!class(dat) %in% "tabyl"]
    attr(dat, "core") <- NULL

    attr(dat, "totals") <- NULL
    attr(dat, "tabyl_type") <- NULL
    attr(dat, "var_names") <- NULL
    dat
  }
}
