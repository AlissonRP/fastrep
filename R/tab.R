tab = function(obj, var1, var2) {
  obj %>%
    dplyr::group_by({{ var1 }}, {{ var2 }}) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    tidyr::spread({{ var2 }}, n)

}


