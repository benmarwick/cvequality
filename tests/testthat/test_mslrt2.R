library(cvequality)

context("mslr_test2")

#' Summary stats from Feltz and Miller 1996
#'
set.seed(1)
miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
                     Mean = c(6.8, 8.5, 6.0),
                     CV =   c(0.090, 0.462, 0.340),
                     N =    c(5, 5, 5))
#' # compute SD from mean and cv
miller$SD <- with(miller, CV * Mean)
#'

  test_that("mslr_test2", {
    expect_equal(mslr_test2(nr = 1e4, n = miller$N, s = miller$SD, x = miller$Mean),
    list(MSLRT = 6.64317,
         p_value = 0.03609557),
    tolerance = .002)
  })
