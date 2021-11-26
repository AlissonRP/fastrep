adorn_totals <- function(dat, where = "row", fill = "-", na.rm = TRUE, name = "Total", ...) {
  if("both" %in% where){
    where <- c("row", "col")
  }

  if (is.list(dat) && !is.data.frame(dat)) {
    purrr::map(dat, adorn_totals, where, fill, na.rm, name)
  } else {
    if (!is.data.frame(dat)) {
      stop("adorn_totals() must be called on a data.frame or list of data.frames")
    }

    numeric_cols <- which(vapply(dat, is.numeric, logical(1)))
    non_numeric_cols <- setdiff(1:ncol(dat), numeric_cols)

    if (rlang::dots_n(...) == 0) {
      numeric_cols <- setdiff(numeric_cols, 1)
      non_numeric_cols <- unique(c(1, non_numeric_cols))
      cols_to_total <- numeric_cols
    } else {
      expr <- rlang::expr(c(...))
      cols_to_total <- tidyselect::eval_select(expr, data = dat)
      if (any(cols_to_total %in% non_numeric_cols)) {
        cols_to_total <- setdiff(cols_to_total, non_numeric_cols)
      }
    }

    if (length(cols_to_total) == 0) {
      stop("at least one targeted column must be of class numeric.  Control target variables with the ... argument. adorn_totals should be called before other adorn_ functions.")
    }

    if (sum(where %in% c("row", "col")) != length(where)) {
      stop("\"where\" must be one of \"row\", \"col\", or c(\"row\", \"col\")")
    }

    if (length(name) == 1) name <- rep(name, 2)



    if ("grouped_df" %in% class(dat)) {
      dat <- dplyr::ungroup(dat)
    }
    dat <- mypdf1:::as_tabyl(dat)

    # set totals attribute
    if (sum(where %in% attr(dat, "totals")) > 0) {
      stop("trying to re-add a totals dimension that is already been added")
    } else if (length(attr(dat, "totals")) == 1) {
      attr(dat, "totals") <- c(attr(dat, "totals"), where)
    } else {
      attr(dat, "totals") <- where
    }

    if ("row" %in% where) {
      # creates the totals row to be appended
      col_sum <- function(a_col, na_rm = na.rm) {
        if (is.numeric(a_col)) {
          sum(a_col, na.rm = na_rm)
        } else {
          if (!is.character(fill)) {
            switch(typeof(a_col),
                   "character" = NA_character_,
                   "integer" = NA_integer_,
                   "double" = if(inherits(a_col, "Date") || inherits(a_col, "POSIXt")) {
                     as.Date(NA_real_, origin = "1970-01-01")
                   } else {
                     NA_real_
                   },
                   "complex" = NA_complex_,
                   NA)
          } else {
            fill
          }
        }
      }

      if (is.character(fill)) {
        col_totals <- purrr::map_df(dat, col_sum)
        not_totaled_cols <- setdiff(1:length(col_totals), cols_to_total)
        col_totals[not_totaled_cols] <- fill
        dat[not_totaled_cols] <- lapply(dat[not_totaled_cols], as.character)
      } else {

        cols_idx <- seq_along(dat)
        names(cols_idx) <- names(dat)

        col_totals <- purrr::map_df(cols_idx, function(i) {
          if (is.numeric(dat[[i]]) && !i %in% cols_to_total) {
            switch(typeof(dat[[i]]),
                   "integer" = NA_integer_,
                   "double" = NA_real_,
                   NA)
          } else {
            col_sum(dat[[i]])
          }
        })

        if (!is.character(dat[[1]]) && !1 %in% cols_to_total) {
          dat[[1]] <- as.character(dat[[1]])
          col_totals[[1]] <- as.character(col_totals[[1]])
        }

      }

      if (! 1 %in% cols_to_total) {
        col_totals[1, 1] <- name[1]
      } else {
        message("Because the first column was specified to be totaled, it does not contain the label 'Total' (or user-specified name) in the totals row")
      }
      dat[(nrow(dat) + 1), ] <- col_totals[1, ]
    }

    if ("col" %in% where) {

      row_totals <- dat %>%
        dplyr::select(cols_to_total) %>%
        dplyr::select_if(is.numeric) %>%
        dplyr::transmute(Total = rowSums(., na.rm = na.rm))

      dat[[name[2]]] <- row_totals$Total
    }

    dat
  }
}
