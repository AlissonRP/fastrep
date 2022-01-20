library(mypdf1)

test_that("sum total", {
  expect_equal(iris %>%
    mypdf1::pdf1_tbl_freq(Species) |> (\(x) x[4, 2])() |> as.numeric(), 150)
  expect_equal(iris %>%
    mypdf1::pdf1_tbl_freq(Species) |> (\(x) x[4, 3])() |> round(2) |> as.numeric(), 1)
})
