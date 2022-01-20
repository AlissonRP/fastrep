library(mypdf1)

test_that("sum total", {
  expect_equal(mtcars |> mypdf1::pdf1_summary() |>   (\(x) x[1,2])() |> as.numeric() |> round(1) ,
               round(mean(mtcars$mpg),1))
})


