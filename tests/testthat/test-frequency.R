library(fastrep)

test_that("sum total", {
  expect_equal(iris %>%
    fastrep::freq_tbl(Species) |> (\(x) x[4, 2])() |> as.numeric(), 150)
  expect_equal(iris %>%
    fastrep::freq_tbl(Species) |> (\(x) x[4, 3])() |> round(2) |> as.numeric(), 1)
  expect_equal(mtcars %>%
    fastrep::freq_tbl(carb, sort_by = absolute_frequency) |> (\(x) x[1, 2])() |> round(2) |> as.numeric(), 1)
  expect_equal(mtcars %>%
    fastrep::freq_tbl(carb, sort_by = relative_frequency) |> (\(x) x[6, 3])() |> round(3) |> as.numeric(), 0.312)
  expect_equal(mtcars %>%
    fastrep::freq_tbl(carb, sort_by = absolute_frequency, desc = T) |> (\(x) x[1, 2])() |> round(3) |> as.numeric(), 10)
  expect_equal(mtcars %>%
    fastrep::freq_tbl(carb, sort_by = relative_frequency, desc = T) |> (\(x) x[1, 3])() |> round(3) |> as.numeric(), 0.312)
})
