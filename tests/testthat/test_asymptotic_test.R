library(cvequality)

context("asymptotic_test")

  test_that("asymptotic_test", {
    expect_equal(asymptotic_test(mtcars$disp, mtcars$am),
    list(D_AD = 2.344839,
         p_value = 0.1256985),
    tolerance = .002)
  })