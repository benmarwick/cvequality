library(cvequality)

context("mlrt_test")
set.seed(1)

  test_that("mlrt_test", {
    expect_equal(mlrt_test(nr = 1e4, mtcars$disp, mtcars$am),
    list(MLRT = 2.046478,
         p_value = 0.1525588),
    tolerance = .002)
  })