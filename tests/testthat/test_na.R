
library(mypdf1)

test_that("sum na's", {
  expect_equal(airquality %>% pdf1_na() %>% dplyr::select("total_NA") %>% sum(), 44)
  expect_equal(iris %>% pdf1_na() %>% dplyr::select("total_NA") %>% sum(), 0)
})
