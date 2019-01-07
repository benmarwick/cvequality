## Update to 0.2.0

* add argument to set seed in functions
* add content to vignette to show how to set seed

## First attempt at update

* Uwe Ligges writes:

Found the following (possibly) invalid URLs:
   URL:
https://cran.r-project.org/web/packages/cvequality/vignettes/how_to_test_CVs.html
     From: README.md
     Status: 200
     Message: OK
     CRAN URL not in canonical form
   The canonical URL of the CRAN page for a package is
     https://CRAN.R-project.org/package=pkgname

The Date field is over a month old.

* I changed the URL to the canonical form (odd that linking to the vignette directly is not ok)
* I changed the date field in DESC to today

R CMD check results
0 errors | 0 warnings | 0 notes

## Fourth attempt at initial submit

* Kurt Hornik writes "DOI processing does not handle embedded < and >."
* recommends I try percent-encoding for angle brackets in DOI, so I've made that change. 

R CMD check results
0 errors | 0 warnings | 1 note (from win-build)

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Ben Marwick <benmarwick@gmail.com>'

New submission

Possibly mis-spelled words in DESCRIPTION:
  Feltz (8:126)
  Krishnamoorthy (8:247)

## Third attempt at initial submit

* Kurt Hornik writes "pls provide DOIs for the references in the Description"
* Added DOIs in Description like so: Author (date) <DOI:xxx/xxx>

R CMD check results
0 errors | 0 warnings | 1 note (from win-build)

Possibly mis-spelled words in DESCRIPTION:
  Feltz (8:126)
  Krishnamoorthy (8:243)

Found the following (possibly) invalid DOIs:
  DOI: 10.1002/(SICI)1097-0258(19960330)15:6<647::AID-SIM184
    From: DESCRIPTION
    Status: Not Found
    Message: 404

## Second attempt at initial submit

* Received feedback from Uwe Ligges
* Corrected misspellings of 'coefficient'
* Added DOIs to references cited, using \doi{} rather than <doi:>, because that's what the win-builder logs say to do

R CMD check results

0 errors | 0 warnings | 1 note

* The note is that this is a new release:

    #> Maintainer: 'Ben Marwick '
 243#> New submission
 244#> License components with restrictions and base license permitting such:
 245#> MIT + file LICENSE
 246#> File 'LICENSE':
 247#> YEAR: 2016
 248#> COPYRIGHT HOLDER: Ben Marwick & Kalimuthu Krishnamoorthy

## Initial submit

R CMD check results

0 errors | 0 warnings | 1 note

* The note is that this is a new release:

    #> Maintainer: 'Ben Marwick '
 243#> New submission
 244#> License components with restrictions and base license permitting such:
 245#> MIT + file LICENSE
 246#> File 'LICENSE':
 247#> YEAR: 2016
 248#> COPYRIGHT HOLDER: Ben Marwick & Kalimuthu Krishnamoorthy

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

# -------------------------------------------------------------------

# Notes to self about testing

# Windows on CRAN
devtools::check_win_devel()

# r-hub multiple systems
devtools::install_github("r-hub/rhub")
rhub::validate_email()
rhub::list_validated_emails()
rhub::check_on_linux()
rhub::check_on_windows()
rhub::check_for_cran()

ch <- rhub::check_for_cran(env_vars = c(`_R_CHECK_FORCE_SUGGESTS_` = "false",
show_status = FALSE))
ch$update()
ch$livelog(3)

