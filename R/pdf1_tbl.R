tbl_pdf=function(v,tit){
  v %>%
    kable::kable(caption=tit,align = "c") |>
    kable::kable_classic(latex_options = "HOLD_position")
}
