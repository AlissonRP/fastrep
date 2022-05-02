library(mypdf1)

test_that("sum total", {
  expect_equal(iris %>%
    mypdf1::pdf1_tbl_freq(Species) |> (\(x) x[4, 2])() |> as.numeric(), 150)
  expect_equal(iris %>%
    mypdf1::pdf1_tbl_freq(Species) |> (\(x) x[4, 3])() |> round(2) |> as.numeric(), 1)
  expect_equal(mtcars %>%
    mypdf1::pdf1_tbl_freq(carb, sort_by = absolute_frequency) |> (\(x) x[1, 2])() |> round(2) |> as.numeric(), 1)
  expect_equal(mtcars %>%
    mypdf1::pdf1_tbl_freq(carb, sort_by = relative_frequency) |> (\(x) x[6, 3])() |> round(3) |> as.numeric(), 0.312)
  expect_equal(mtcars %>%
    mypdf1::pdf1_tbl_freq(carb, sort_by = absolute_frequency, desc = T) |> (\(x) x[1, 2])() |> round(3) |> as.numeric(), 10)
  expect_equal(mtcars %>%
    mypdf1::pdf1_tbl_freq(carb, sort_by = relative_frequency, desc = T) |> (\(x) x[1, 3])() |> round(3) |> as.numeric(), 0.312)
  expect_warning(
    airquality |>
      mypdf1::pdf1_tbl_freq2(Ozone, Month), "Your dataframe has NA, they will be removed from calculations"
  )
})
