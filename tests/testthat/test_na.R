
library(fastrep)

test_that("sum na's", {
  expect_equal(airquality %>% rep_na() %>% dplyr::select(na_count) %>% sum(), 44)
  expect_equal(iris %>% rep_na() %>% dplyr::select(na_count) %>% sum(), 0)
})
