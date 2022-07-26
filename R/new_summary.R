


x = rnorm(5)
y = rnorm(5)
w = rep("x", 5)
z = factor(c(1,2,35,6, 3))
df = data.frame(x, y, w, z)

sumary <- function(obj, na_rm = TRUE) {
  funs <- c(mean = mean, median = median, sd = sd, min = min, max = max)
  args <- list(na.rm = na_rm)
  obj |>
    purrr::map_df(~ funs %>%
                    purrr::map(purrr::exec, .x, !!!args), .id = "variable")


}



## FINAL POINT
df |>
 dplyr::select(where((is.numeric))) |>
  purrr::map_df(round, 3)



