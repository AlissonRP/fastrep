library(fastrep)

col0 <- mtcars |>
  tab(cyl, am) |>
  with(`0`)

col1 <- mtcars |>
  tab(cyl, am) |>
  with(`1`)

test_that("tab testes", {
  expect_equal(
    col0[1], table(mtcars$cyl, mtcars$am)[2, 2]
  )
  expect_equal(
    col0[2], table(mtcars$cyl, mtcars$am)[2, 1]
  )
  expect_equal(
    col1[3], table(mtcars$cyl, mtcars$am)[3, 2]
  )
  expect_equal(
    col1[1], table(mtcars$cyl, mtcars$am)[1, 2]
  )
})


