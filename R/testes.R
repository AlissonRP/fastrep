
test=function(df,v1,v2,tit){
  title2=df |>  dplyr::select({{v2}}) |> names()
  catlev=nrow(unique(df |>
                         dplyr::select({{v2}})))+1
iris %>%
  mypdf1::pdf1_freq.tbl2({{v1}},{{v2}},tit) |>
  mypdf1::pdf1_tbl('teste') |>
  kableExtra::add_header_above(c(" ", setNames(catlev,title2)), align ="c")
}


test(iris,Sepal.Length,Species,'tit')


#https://github.com/haozhu233/kableExtra/issues/415
#https://stackoverflow.com/questions/45206908/kableextra-dynamic-add-header-above-labeling


