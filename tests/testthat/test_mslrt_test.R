library(cvequality)

context("mslr_test")
set.seed(1)

  test_that("mslr_test", {
    expect_equal(mslr_test(nr = 1e4, mtcars$disp, mtcars$am),
    list(MSLRT = 2.046478,
         p_value = 0.1525588),
    tolerance = .002)
  })