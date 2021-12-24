


pdf1_na=function(df){
  is.na(df) |>
    as.data.frame() |>
    purrr::map_dbl(sum)
}
