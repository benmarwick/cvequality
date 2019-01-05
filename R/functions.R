globalVariables(c("stats", "aggregate", "pchisq", "rchisq", "rnorm", "sd"))

# Miller test for raw data ----------------------------

#' Asymptotic test for the equality of coefficients of variation from k populations, using measurement data
#'
#' Test for k samples (k sample populations with unequal sized) from
#' Feltz CJ, Miller GE (1996) An asymptotic test for the equality of coefficients
#' of variation from k population. Stat Med 15:647–658
#'
#' @param x a numeric vector containing individual measurement values
#' @param y a vector of any type containing a grouping variable
#'
#' @return a list with the test statistic and p-value
#' @export
#'
#' @examples
#'
#'  y <- unlist(lapply(letters[1:5], function(i) rep(i, 20)))
#'  x <- rnorm(100)
#'
#'  asymptotic_test(x, y)
#'
asymptotic_test <-
  function(x, y, seed){

    ## set the seed to ensure reproducibiilty
    if (!missing(seed))
      set.seed(seed)

    if (!is.numeric(x) && (!is.numeric(y) | !is.character(y) | !is.integer(y))) {
      warning("x is not numeric or y is not numeric, character or integer: returning NA")
      return(NA_real_)
    }

    if (anyNA(x)) {
      warning("x cannot contain any NA values: returning NA")
      return(NA_real_)
    }

    if (anyNA(y)) {
      warning("y cannot contain any NA values: returning NA")
      return(NA_real_)
    }

    # k is the number of groups
    k <- length(unique(y))
    # j is an index referring to the group number
    # n_j is the sample size of the jth group
    n_j <- data.frame(table(y))$Freq
    # s_j is the sd of the jth population
    s_j <-  aggregate(x, by = list(y), FUN = sd)[2]
    # x_j is the mean of the jth population
    x_j <- aggregate(x, by = list(y), FUN = mean)[2]

    m_j <- n_j - 1

    D <- (sum(m_j * (s_j/x_j))) / sum(m_j)

    D_AD <- (sum(m_j * (s_j/x_j - D)^2 )) / ( D^2 * (0.5 + D^2) )

    # D_AD distributes as a central chi-sq random variable with k - 1 degrees of freedom
    p_value <-  pchisq(D_AD,
                       k - 1,
                       lower.tail = FALSE)

    return(list(D_AD = D_AD,
                p_value = p_value))
  }


# Miller test for summary data ------------------------

#' Asymptotic test for the equality of coefficients of variation from k populations, using summary statistics when raw measurement data are not available.
#'
#' Test for k samples (k sample populations with unequal sized) from
#' Feltz CJ, Miller GE (1996) An asymptotic test for the equality of coefficients
#' of variation from k population. Stat Med 15:647–658
#'
#' @param k a numeric vector the number of groups
#' @param n a numeric vector the numer of measurements in each group
#' @param s a numeric vector the standard deviation of each group
#' @param x a numeric vector the mean of each group
#'
#' @return a list with the test statistic and p-value
#' @export
#'
#' @examples
#'
#' # Summary stats from Feltz and Miller 1996
#'
#' miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
#'                     Mean = c(6.8, 8.5, 6.0),
#'                     CV =   c(0.090, 0.462, 0.340),
#'                     N =    c(5, 5, 5))
#' # compute SD from mean and cv
#' miller$SD <- with(miller, CV * Mean)
#'
#'  asymptotic_test2(k = nrow(miller), n = miller$N, s = miller$SD, x = miller$Mean)
#'
asymptotic_test2 <-
  function(k, n, s, x, seed){

    ## set the seed to ensure reproducibiilty
    if (!missing(seed))
      set.seed(seed)


    if (!is.integer(k) && !is.numeric(k) && !is.integer(n) && !is.numeric(n) && !is.numeric(s) && !is.numeric(x) ){
      warning("input values are not numeric: returning NA")
      return(NA_real_)
    }


    # k is the number of groups
    k <- k
    # j is an index referring to the group number
    # n_j is the sample size of the jth group
    n_j <- n
    # s_j is the sd of the jth population
    s_j <-  s
    # x_j is the mean of the jth population
    x_j <- x

    m_j <- n_j - 1

    D <- (sum(m_j * (s_j/x_j))) / sum(m_j)

    D_AD <- (sum(m_j * (s_j/x_j - D)^2 )) / ( D^2 * (0.5 + D^2) )

    # D_AD distributes as a central chi-sq random variable with k - 1 degrees of freedom
    p_value <-  pchisq(D_AD,
                       k - 1,
                       lower.tail = FALSE)

    return(list(D_AD = D_AD,
                p_value = p_value))
  }



# Krishnamoorthy test for raw data --------------------

#' Modified signed-likelihood ratio test (SLRT) for equality of CVs, using measurement data

#' @references \url{http://link.springer.com/article/10.1007/s00180-013-0445-2}
#' Krishnamoorthy, K. & Lee, M. Comput Stat (2014) 29: 215. doi:10.1007/s00180-013-0445-2
#'
#'
#' @param nr numeric vector length one, number of simulation runs, default is 1e3
#' @param x a numeric vector containing individual measurement values
#' @param y a vector of any type containing a grouping variable
#'
#' @return a list with the test statistic and p-value
#' @export
#'
#' @examples
#'
#'  x <- rnorm(100)
#'  y <- unlist(lapply(letters[1:5], function(i) rep(i, 20)))
#'
#'  mslr_test(nr = 1e3, x, y)
#'
#'
mslr_test <-
  function(nr = 1e3, x, y, seed){

    ## set the seed to ensure reproducibiilty
    if (!missing(seed))
      set.seed(seed)

    if (!is.numeric(x) && !is.numeric(y) && !is.character(y)) {
      warning("x is not numeric or y is not numeric or character: returning NA")
      return(NA_real_)
    }

    if (anyNA(x)) {
      warning("x cannot contain any NA values: returning NA")
    return(NA_real_)
    }

    if (anyNA(y)) {
      warning("y cannot contain any NA values: returning NA")
    return(NA_real_)
      }

    # j is an index referring to the group number
    # n is the sample size of the jth group
    n <- data.frame(table(y))$Freq
    # s is the sd of the jth population
    s <-  aggregate(x, by = list(y), FUN = sd)$x
    # x_j is the mean of the jth population
    x <- aggregate(x, by = list(y), FUN = mean)$x


    k <- length(x)
    gv <- as.vector(nr)
    df <- n - 1
    xst0 <- LRT_STAT(n, x, s)
    uh0 <- xst0[1:k]
    tauh0 <- xst0[k+1]; stat0 <- xst0[k+2]
    sh0 <- tauh0*uh0
    se0 <- tauh0*uh0/sqrt(n)
    # PB estimates of the mean and SD of the LRT
    for(ii in 1:nr){
      z <- rnorm(k)
      x <- uh0 + z*se0
      ch <- rchisq(k,df)
      s <- sh0*sqrt(ch/df)
      xst <- LRT_STAT(n,x,s)
      gv[ii] <- xst[k+2]
    }
    am <- mean(gv); sd <- sd(gv)
    # end PB estimates
    statm <- sqrt(2.0*(k-1))*(stat0-am)/sd+(k-1)
    pval <- 1.0-pchisq(statm,k-1)


    return(list(MSLRT = statm,
                p_value = pval))
  }






#' # Modified signed-likelihood ratio test (SLRT) for equality of CVs, using summary statistics when raw measurement data are not available.
#'
#'
# Krishnamoorthy, K. & Lee, M. Comput Stat (2014) 29: 215. doi:10.1007/s00180-013-0445-2
#' @references \url{http://link.springer.com/article/10.1007/s00180-013-0445-2}
#
#'
#' @param nr numeric vector lenght one, number of simulation runs
#' @param n a numeric vector, the number of observations in each group
#' @param x a numeric vector, the mean of each group
#' @param s a numeric vector, the standard deviation of each group
#'
#' @return a list with the test statistic and p-value
#' @export
#'
#' @examples
#'
#' # Summary stats from Feltz and Miller 1996
#'
#' miller <- data.frame(test = c('ELISA', 'WEHI', '`Viral inhibition`'),
#'                     Mean = c(6.8, 8.5, 6.0),
#'                     CV =   c(0.090, 0.462, 0.340),
#'                     N =    c(5, 5, 5))
#' # compute SD from mean and cv
#' miller$SD <- with(miller, CV * Mean)
#'
#'  mslr_test2(nr = 1e3, n = miller$N, s = miller$SD, x = miller$Mean)
#'
#'
mslr_test2 <-
  function(nr, n, x, s, seed){

    ## set the seed to ensure reproducibiilty
    if (!missing(seed))
      set.seed(seed)

    if (!is.numeric(nr) &&!is.numeric(n) && !is.integer(n) && !is.numeric(s) && !is.numeric(x)) {
      warning("input values are not numeric: returning NA")
      return(NA_real_)
    }


  k <- length(x)
  gv <- as.vector(nr)
  df <- n - 1
  xst0 <- LRT_STAT(n, x, s)
  uh0 <- xst0[1:k]
  tauh0 <- xst0[k+1]; stat0 <- xst0[k+2]
  sh0 <- tauh0*uh0
  se0 <- tauh0*uh0/sqrt(n)
  # PB estimates of the mean and SD of the LRT
  for(ii in 1:nr){
    z <- rnorm(k)
    x <- uh0 + z*se0
    ch <- rchisq(k,df)
    s <- sh0*sqrt(ch/df)
    xst <- LRT_STAT(n,x,s)
    gv[ii] <- xst[k+2]
  }
  am <- mean(gv); sd <- sd(gv)
  # end PB estimates
  statm <- sqrt(2.0*(k-1))*(stat0-am)/sd+(k-1)
  pval <- 1.0-pchisq(statm,k-1)


  return(list(MSLRT = statm,
              p_value = pval))
}


#' LRT_STAT, required by mlrt_test
#'
#' @param n ... as above
#' @param x ...
#' @param s ...
#'
#' @return xx
#'
LRT_STAT <- function(n, x, s, seed){

  ## set the seed to ensure reproducibiilty
  if (!missing(seed))
    set.seed(seed)

  k <- length(x)
  df <- n-1
  ssq <- s**2
  vsq <- df*ssq/n
  v <- sqrt(vsq)
  sn <- sum(n)
  #MLES
  tau0 <- sum(n*vsq/x**2)/sn
  l <- 1
  repeat{
    uh <- (-x+sqrt(x**2+4.0*tau0*(vsq+x**2)))/2.0/tau0
    tau <- sum(n*(vsq+(x-uh)**2)/uh**2)/sn
    if(abs(tau-tau0) <= 1.0e-7 || l > 30) break
    l <- l + 1
    tau0 <- tau
  }
  tauh <- sqrt(tau)
  #END MLES
  elf <- 0.0; clf <- 0.0
  for(j in 1:k){
    clf <- clf-n[j]*log(tauh*uh[j])-(n[j]*(vsq[j]+(x[j]-uh[j])**2))/(2.0*tauh**2*uh[j]**2)
    elf <- elf-n[j]*log(v[j])-n[j]/2.0
  }
  stat <- 2.0*(elf-clf)
  return(c(uh,tauh,stat))
}


