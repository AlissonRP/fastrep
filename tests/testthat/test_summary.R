library(mypdf1)

test_that("sum mean", {
  expect_equal(
    mtcars |> mypdf1::pdf1_summary() |> (\(x) x[1, 2])() |> as.numeric() |> round(1),
    round(mean(mtcars$mpg), 1)
  )
  expect_equal(
    mtcars |> mypdf1::pdf1_summary() |> (\(x) x[5, 4])() |> as.numeric() |> round(1),
    round(sd(mtcars$drat), 1)
  )
  expect_warning(
    iris |> mypdf1::pdf1_summary(), "string and factors variables were removed for calculations"
  )
  expect_equal(
    airquality |> mypdf1::pdf1_summary(na_rm=F) |> (\(x) x[1, 2])() |> as.numeric() |> round(1),
    as.numeric(NA))
  expect_warning(
    airquality |> mypdf1::pdf1_summary() ,"Your dataframe has NA, they will be removed from calculations \n  use na_rm = FALSE if you want to keep them")

})
