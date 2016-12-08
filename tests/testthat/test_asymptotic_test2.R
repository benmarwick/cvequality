library(cvequality)

context("asymptotic_test2")

#' Summary stats from Feltz and Miller 1996
#'
miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
                     Mean = c(6.8, 8.5, 6.0),
                     CV =   c(0.090, 0.462, 0.340),
                     N =    c(5, 5, 5))
#' # compute SD from mean and cv
miller$SD <- with(miller, CV * Mean)
#'

  test_that("asymptotic_test2", {
    expect_equal(asymptotic_test2(k = nrow(miller), n = miller$N, s = miller$SD, x = miller$Mean),
    list(D_AD = 5.530452,
         p_value = 0.06296186),
    tolerance = .002)
  })