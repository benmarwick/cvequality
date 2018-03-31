---
output: github_document
---
<!-- rmarkdown v1 -->
<!-- README.md is generated from README.Rmd. Please edit that file -->




[![Last-changedate](https://img.shields.io/badge/last%20change-2018--03--31-brightgreen.svg)](https://github.com/benmarwick/cvequality/commits/master) 
[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.4.4-brightgreen.svg)](https://cran.r-project.org/)
[![Licence](https://img.shields.io/github/license/mashape/apistatus.svg)](http://choosealicense.com/licenses/mit/) 
[![Travis-CI Build Status](https://travis-ci.org/benmarwick/cvequality.svg?branch=master)](https://travis-ci.org/benmarwick/cvequality)
[![Coverage Status](https://img.shields.io/codecov/c/github/benmarwick/cvequality/master.svg)](https://codecov.io/github/benmarwick/cvequality?branch=master) 
[![cran version](http://www.r-pkg.org/badges/version/cvequality)](https://cran.r-project.org/package=cvequality) 
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/cvequality)](https://cran.r-project.org/package=cvequality)
[![ORCiD](https://img.shields.io/badge/ORCiD-0000--0001--7879--4531-green.svg)](http://orcid.org/0000-0001-7879-4531)


## cvequality: A package of tests for the equality of coefficients of variation from multiple groups

This package contains functions to test for significant differences in coefficients of variation (CVs) among multiple groups of observations. 

### Citation

If you use this package, please cite both the package and the paper that first presented the algorithm that you used (see the [vignette on CRAN](https://CRAN.R-project.org/package=cvequality) for details of these). Cite the package as follows:

> Marwick, B. and K. Krishnamoorthy 2018 cvequality: Tests for the Equality of Coefficients of Variation from Multiple Groups. R software package version 0.1.3. Retrieved from https://github.com/benmarwick/cvequality, on 31/03/2018

And reference it in your text similar to this example:

> "We used the R package cvequality (Version 0.1.3; Marwick and Krishnamoorthy 2018) to test for significant differences [etc.]."

A BibTeX entry for LaTeX users is:

```
 @Manual{,
    title = {cvequality: Tests for the Equality of Coefficients of Variation from Multiple Groups},
    author = {Ben Marwick and Kalimuthu Krishnamoorthy},
    note = {R package version 0.1.3},
    url = {https://github.com/benmarwick/cvequality},
  }
```

You can also access the citation details from your R console with `citation(package = "cvequality")`

### Installation

To install the package:


```r
# from CRAN
install.packages("cvequality")
```

Or you can get the development version from GitHub:


```r
# or from GitHub
if (!require("ghit")) install.packages("ghit") # check if you have ghit (to install pkgs from github), if not, it will be installed here
ghit::install_github("benmarwick/cvequality")
```

Please see the [vignette on CRAN](https://CRAN.R-project.org/package=cvequality) for detailed examples of how to use the functions in this package. 

### Contributing and Getting Help

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

If you'd like to get help with using the package, please [post an issue](https://github.com/benmarwick/cvequality/issues/new).
