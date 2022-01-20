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
})
